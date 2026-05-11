# actions

Reusable GitHub Actions workflows for `ojhermann-org`.

## Workflow catalog

_None yet — `prek-ci`, `python-ci`, and `nix-ci` land in subsequent PRs._

## Version pinning

Consumers should pin reusable workflow references to a tag:

```yaml
jobs:
  prek:
    uses: ojhermann-org/actions/.github/workflows/prek-ci.yml@v1
```

- `@v1` — moving major tag. Picks up non-breaking changes automatically.
- `@v1.x.y` — exact version. Use this if you need hard pinning.

Releases are cut manually via the `Release` workflow (`workflow_dispatch`). Each release tags `v{MAJOR}.{MINOR}.{PATCH}` and force-moves the `v{MAJOR}` tag.

## Local development

Enter the dev shell to get `prek` + lint tools (`nixfmt`, `statix`, `deadnix`, `shellcheck`, `actionlint`, `yamllint`):

```
nix develop
```

`direnv` activates this automatically on `cd`. The shell hook installs the pre-commit hook on first entry.

Run all hooks across the repo:

```
prek run --all-files
```
