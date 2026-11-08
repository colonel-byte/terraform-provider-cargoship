# Changelog

## [0.6.0](https://github.com/colonel-byte/terraform-provider-cargoship/compare/v0.5.0...v0.6.0) (2026-11-08)


### ⚠ BREAKING CHANGES

* **deps:** update cargoship to v0.40.0 ([#23](https://github.com/colonel-byte/terraform-provider-cargoship/issues/23))

### Miscellaneous

* **deps:** update cargoship to v0.40.0 ([#23](https://github.com/colonel-byte/terraform-provider-cargoship/issues/23)) ([bf11a04](https://github.com/colonel-byte/terraform-provider-cargoship/commit/bf11a04c3f1d869c093aaa82f9eab93b485ebfdc))

## [0.5.0](https://github.com/colonel-byte/terraform-provider-cargoship/compare/v0.4.0...v0.5.0) (2026-11-08)


### ⚠ BREAKING CHANGES

* **deps:** update cargoship to v0.39.0 ([#21](https://github.com/colonel-byte/terraform-provider-cargoship/issues/21))

### Miscellaneous

* **deps:** update cargoship to v0.39.0 ([#21](https://github.com/colonel-byte/terraform-provider-cargoship/issues/21)) ([5812b02](https://github.com/colonel-byte/terraform-provider-cargoship/commit/5812b0275120c32b4c09567c7369b5e81d0b4070))

## [0.4.0](https://github.com/colonel-byte/terraform-provider-cargoship/compare/v0.3.0...v0.4.0) (2026-11-04)


### ⚠ BREAKING CHANGES

* **deps:** update cargoship to v0.38.0 ([#19](https://github.com/colonel-byte/terraform-provider-cargoship/issues/19))

### Miscellaneous

* **deps:** update cargoship to v0.38.0 ([#19](https://github.com/colonel-byte/terraform-provider-cargoship/issues/19)) ([92e1a31](https://github.com/colonel-byte/terraform-provider-cargoship/commit/92e1a3115dc7a518cb6b700306f7c61fd0dc9df8))

## [0.3.0](https://github.com/colonel-byte/terraform-provider-cargoship/compare/v0.2.0...v0.3.0) (2026-11-04)


### ⚠ BREAKING CHANGES

* add code owners file ([#18](https://github.com/colonel-byte/terraform-provider-cargoship/issues/18))

### CI/CD

* add code owners file ([#18](https://github.com/colonel-byte/terraform-provider-cargoship/issues/18)) ([be04cd6](https://github.com/colonel-byte/terraform-provider-cargoship/commit/be04cd6d5aa562741ee44a27f3edb5d9ff8c8a5d))


### Build

* **deps:** Bump github.com/colonel-byte/cargoship from 0.36.0 to 0.37.0 ([#16](https://github.com/colonel-byte/terraform-provider-cargoship/issues/16)) ([95cda86](https://github.com/colonel-byte/terraform-provider-cargoship/commit/95cda86815be70c8c6351f2985556e40e5f70ed7))
* **deps:** Bump github.com/zarf-dev/zarf from 0.88.0 to 0.89.0 ([#15](https://github.com/colonel-byte/terraform-provider-cargoship/issues/15)) ([c2ad711](https://github.com/colonel-byte/terraform-provider-cargoship/commit/c2ad7110b176ba5eee68f0dbc2e4ae47cd2959c3))

## [0.2.0](https://github.com/colonel-byte/terraform-provider-cargoship/compare/v0.1.1...v0.2.0) (2026-10-27)


### ⚠ BREAKING CHANGES

* **deps:** update to cargoship v0.36.0 ([#14](https://github.com/colonel-byte/terraform-provider-cargoship/issues/14))

### Miscellaneous

* **deps:** update to cargoship v0.36.0 ([#14](https://github.com/colonel-byte/terraform-provider-cargoship/issues/14)) ([49facdf](https://github.com/colonel-byte/terraform-provider-cargoship/commit/49facdf0b1aaab35eb656dc7b75af6480cae3639))


### CI/CD

* add dependabot config and config validation workflow ([#11](https://github.com/colonel-byte/terraform-provider-cargoship/issues/11)) ([cd1655b](https://github.com/colonel-byte/terraform-provider-cargoship/commit/cd1655b7535a516477b86b0aedbbeb3dea1b41d3))
* run the pr title check on pull requests only ([#13](https://github.com/colonel-byte/terraform-provider-cargoship/issues/13)) ([ae1bf77](https://github.com/colonel-byte/terraform-provider-cargoship/commit/ae1bf7783fa383acced44c2fd30ab593530d2efb))

## [0.1.1](https://github.com/colonel-byte/terraform-provider-cargoship/compare/v0.1.0...v0.1.1) (2026-10-26)


### Features

* import the OpenTofu provider from colonel-byte/cargoship ([#1](https://github.com/colonel-byte/terraform-provider-cargoship/issues/1)) ([c48c674](https://github.com/colonel-byte/terraform-provider-cargoship/commit/c48c674e93b03fcf4dd9d58d069bc6faa7e5cda8))
* **init:** repo creation ([43331d6](https://github.com/colonel-byte/terraform-provider-cargoship/commit/43331d630f5f9cabffb1a8aebb903f34e50800cd))


### Bug Fixes

* **ci:** sign with the organisation cosign secrets, not cargoship's repo ones ([#9](https://github.com/colonel-byte/terraform-provider-cargoship/issues/9)) ([b77cbea](https://github.com/colonel-byte/terraform-provider-cargoship/commit/b77cbea947aa54b384455f69c019bac6c2723804))


### Documentation

* generate the provider reference with tfplugindocs ([#4](https://github.com/colonel-byte/terraform-provider-cargoship/issues/4)) ([92789fc](https://github.com/colonel-byte/terraform-provider-cargoship/commit/92789fc65f2ada19502250021023467fb8893c0b))
* rewrite the imported records for this repository ([#5](https://github.com/colonel-byte/terraform-provider-cargoship/issues/5)) ([3f430ca](https://github.com/colonel-byte/terraform-provider-cargoship/commit/3f430cad6d827190c6b8a09b93a5de2b7c73a507))


### CI/CD

* add lint, unit test, hook and PR title workflows ([#2](https://github.com/colonel-byte/terraform-provider-cargoship/issues/2)) ([570658c](https://github.com/colonel-byte/terraform-provider-cargoship/commit/570658c610dacd9c90ecdb3b77ad7a8720216bc7))


### Build

* add goreleaser and release-please, signing with gpg and cosign ([#3](https://github.com/colonel-byte/terraform-provider-cargoship/issues/3)) ([3aa3753](https://github.com/colonel-byte/terraform-provider-cargoship/commit/3aa37539b0f89605803a1487286cd566314d91c3))
* vendor dependencies so a build needs no module proxy ([#6](https://github.com/colonel-byte/terraform-provider-cargoship/issues/6)) ([9231680](https://github.com/colonel-byte/terraform-provider-cargoship/commit/92316807c446da1da0e552117105770a659d292e))
