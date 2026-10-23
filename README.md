# terraform-provider-cargoship

The OpenTofu provider for [cargoship](https://github.com/colonel-byte/cargoship). The configuration describes the fleet, cargoship owns the phase ordering, and an apply converges the cluster - the same phases `cargoship apply` runs, driven from `tofu` instead of the CLI.

Credentials are read from the environment rather than taken as attributes - `CARGOSHIP_VAULT_PASSWORD` or `ANSIBLE_VAULT_PASSWORD` for an Ansible Vault password, `CARGOSHIP_AGE_IDENTITY_FILE` for an age identity - so no key material reaches the state file. See [`docs/agent/choice-tofu-secrets.md`](docs/agent/choice-tofu-secrets.md).

## What it provides

| Name                            | Kind        | What it does                                                             |
| ------------------------------- | ----------- | ------------------------------------------------------------------------ |
| `cargoship_cluster`             | Resource    | Converges a cluster: prepare, apply, and the phases between them         |
| `cargoship_cluster_facts`       | Data source | Reads the fleet without changing it - engine versions, host facts        |

The generated reference is under [`docs/`](docs/).

## Installing it

cargoship is for air-gapped management nodes, so the provider is installed through a mirror rather than resolved from `registry.opentofu.org`. [`examples/terragrunt/.tofurc.example`](examples/terragrunt/.tofurc.example) shows the `oci_mirror` block; [`docs/agent/choice-tofu-provider-layout.md`](docs/agent/choice-tofu-provider-layout.md) explains why that is the primary channel.

## Using it

A worked layout, module and Terragrunt configuration both, is in [`examples/terragrunt/`](examples/terragrunt/), and the practitioner guide is [`docs/guides/opentofu-terragrunt.md`](docs/guides/opentofu-terragrunt.md).

```hcl
provider "cargoship" {
  concurrency     = 0
  connect_timeout = "1m"
}
```

## Developing it

[`docs/dev/tofu-provider.md`](docs/dev/tofu-provider.md) has the development loop, and [`docs/dev/e2e-tofu-tests.md`](docs/dev/e2e-tofu-tests.md) how the end-to-end suite runs.

```sh
go build ./...
go test ./...
```

The decision records behind the shape of the provider are in [`docs/agent/`](docs/agent/).

## License

Apache 2.0 - see [LICENSE](LICENSE).
