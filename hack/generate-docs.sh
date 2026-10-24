#!/usr/bin/env bash
# Copyright 2026 colonel-byte
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Regenerates docs/index.md, docs/resources/ and docs/data-sources/ with tfplugindocs.
#
# tfplugindocs is not run against the provider directly, which is the usual way, for two
# reasons. It shells out to `terraform` and assumes the provider is published under the
# `hashicorp` namespace, so it looks for registry.opentofu.org/hashicorp/cargoship and finds
# nothing. And when terraform is not already on PATH it downloads one, which currently fails
# outright: the HashiCorp release key tfplugindocs pins has expired.
#
# Both go away by producing the schema here and handing it over with --providers-schema.
# `tofu providers schema -json` is the same command tfplugindocs would have run, against the
# tool this provider is actually for, with the real source address.
set -euo pipefail

tfplugindocs_version="v0.23.0"
# The version the throwaway mirror is keyed by. It never reaches an artifact - the schema is
# the same whatever it is called.
version="0.1.0"

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
work="$(mktemp -d)"
trap 'rm -rf "${work}"' EXIT

mirror="${work}/mirror/registry.opentofu.org/colonel-byte/cargoship/${version}/$(go env GOOS)_$(go env GOARCH)"
mkdir -p "${mirror}"
go build -o "${mirror}/terraform-provider-cargoship_v${version}" "${root}"

cat > "${work}/main.tf" <<EOF
terraform {
  required_providers {
    cargoship = {
      source  = "colonel-byte/cargoship"
      version = "${version}"
    }
  }
}
EOF

cat > "${work}/tofurc" <<EOF
provider_installation {
  filesystem_mirror {
    path    = "${work}/mirror"
    include = ["registry.opentofu.org/colonel-byte/*"]
  }
  direct {
    exclude = ["registry.opentofu.org/colonel-byte/*"]
  }
}
EOF

export TF_CLI_CONFIG_FILE="${work}/tofurc"
tofu -chdir="${work}" init -input=false
tofu -chdir="${work}" providers schema -json > "${work}/full-schema.json"

# tofu keys the schema by the full source address, and tfplugindocs looks it up by
# --provider-name. That name is also what it strips from `cargoship_cluster` to title a page,
# so it has to stay the short name and the key is rewritten to match instead.
python3 - "${work}/full-schema.json" "${work}/schema.json" <<'PYTHON'
import json
import sys

source = "registry.opentofu.org/colonel-byte/cargoship"
with open(sys.argv[1]) as handle:
    doc = json.load(handle)
doc["provider_schemas"] = {"cargoship": doc["provider_schemas"][source]}
with open(sys.argv[2], "w") as handle:
    json.dump(doc, handle)
PYTHON

cd "${root}"
go run "github.com/hashicorp/terraform-plugin-docs/cmd/tfplugindocs@${tfplugindocs_version}" generate \
  --provider-name cargoship \
  --providers-schema "${work}/schema.json"
