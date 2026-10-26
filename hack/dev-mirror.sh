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

# Builds the provider for this machine into a filesystem_mirror layout under build/mirror, which
# is what the e2e suite runs `tofu` against and what a .tofurc points at for a manual run.
#
# Three things about the layout are not arbitrary. The registry hostname is part of the path
# because a configuration resolves a provider by source address and a mirror redirects that
# address rather than replacing it. The version directory has to hold a version OpenTofu accepts:
# 0.0.0 is refused outright, reserved for a provider that is not published. And the binary is
# named terraform-provider-cargoship_v<version>, which is the name OpenTofu looks for inside the
# directory rather than one this repository chooses.
set -euo pipefail

version="${1:-0.1.0}"

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
platform="$(go env GOOS)_$(go env GOARCH)"
dir="${root}/build/mirror/registry.opentofu.org/colonel-byte/cargoship/${version}/${platform}"

mkdir -p "${dir}"
go build -o "${dir}/terraform-provider-cargoship_v${version}" "${root}"

echo "provider ${version} built into ${root}/build/mirror"
