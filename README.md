# actions

Reusable GitHub Actions workflows for `ojhermann-org`.

## Workflow catalog

### `prek-ci.yml`

Runs `prek run --all-files` on the calling repo.

For Nix-flake repos (default), prek runs inside `nix develop` so it picks up tool versions from the consumer's `flake.nix` devShell. `DeterminateSystems/magic-nix-cache-action` caches the devShell closure across CI runs.

For non-Nix repos, set `nix-flake: false` to use `j178/prek-action` directly — but this only works if the `prek.toml` has no `language = "system"` hooks that need binaries on PATH.

| Input | Type | Default | Description |
|---|---|---|---|
| `nix-flake` | bool | `true` | Run prek inside `nix develop`. Requires consumer's devShell to include `prek` and the binaries `prek.toml`'s system hooks reference. |

Caller stub:

```yaml
jobs:
  prek:
    uses: ojhermann-org/actions/.github/workflows/prek-ci.yml@v1
```

For a non-Nix consumer:

```yaml
jobs:
  prek:
    uses: ojhermann-org/actions/.github/workflows/prek-ci.yml@v1
    with:
      nix-flake: false
```

### `python-ci.yml`

_Lands in a follow-up PR._

### `nix-ci.yml`

_Lands in a follow-up PR._

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
