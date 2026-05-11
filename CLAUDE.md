# actions

Reusable GitHub Actions workflows for ojhermann-org.

## Reference docs

(Add language-specific reference links here as the project grows.)

## Repo structure

```
flake.nix          # Nix devShell
prek.toml          # Pre-commit hooks
.helix/            # Helix editor config
.github/workflows/ # CI
```

## Development

`direnv` picks up `.envrc` automatically. To enter the dev shell manually:

```
nix develop
```

Activate the git hooks once after cloning:

```
prek install
```
