# Poetry Commands Reference Table

## Project Setup and Initialization

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `poetry new` | Creates a new Poetry project with the default structure | `poetry new my-project` |
| `poetry new --src` | Creates a new Poetry project with src layout | `poetry new --src my-project` |
| `poetry new --name` | Creates a new Poetry project with custom package name | `poetry new my-project --name custom_pkg` |
| `poetry init` | Interactively creates a pyproject.toml for existing projects | `poetry init` |

## Dependency Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `poetry add` | Adds a package to the project dependencies | `poetry add requests` |
| `poetry add --group` | Adds a package to a specific dependency group | `poetry add pytest --group dev` |
| `poetry add --optional` | Adds a package as an optional dependency | `poetry add colorama --optional` |
| `poetry add --extras` | Adds a package with specific extras | `poetry add django[mysql]` |
| `poetry add --editable` | Adds a package in development mode | `poetry add --editable ../my-package/` |
| `poetry remove` | Removes a package from dependencies | `poetry remove requests` |
| `poetry remove --group` | Removes a package from a specific dependency group | `poetry remove pytest --group dev` |
| `poetry install` | Installs dependencies from pyproject.toml | `poetry install` |
| `poetry install --no-dev` | Installs without development dependencies | `poetry install --no-dev` |
| `poetry install --no-root` | Installs dependencies without the root package | `poetry install --no-root` |
| `poetry install --sync` | Synchronizes the environment with the lock file | `poetry install --sync` |
| `poetry update` | Updates all dependencies to the latest version | `poetry update` |
| `poetry update [package]` | Updates a specific package | `poetry update requests` |
| `poetry lock` | Locks dependencies without installing them | `poetry lock` |
| `poetry lock --no-update` | Refreshes lock file without updating dependencies | `poetry lock --no-update` |
| `poetry show` | Lists all installed packages | `poetry show` |
| `poetry show [package]` | Shows information about a specific package | `poetry show requests` |
| `poetry show --tree` | Shows dependencies as a tree | `poetry show --tree` |
| `poetry show --latest` | Shows latest available versions of packages | `poetry show --latest` |
| `poetry show --outdated` | Shows only outdated packages | `poetry show --outdated` |

## Virtual Environment Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `poetry env info` | Displays information about the virtual environment | `poetry env info` |
| `poetry env list` | Lists all virtual environments associated with the project | `poetry env list` |
| `poetry env use` | Sets a specific Python version for the virtual environment | `poetry env use python3.9` |
| `poetry env use system` | Uses the system Python instead of creating a virtual environment | `poetry env use system` |
| `poetry env remove` | Removes a virtual environment | `poetry env remove python3.9` |
| `poetry run` | Runs a command within the virtual environment | `poetry run pytest` |
| `poetry shell` | Activates the virtual environment in a new shell | `poetry shell` |

## Building and Publishing

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `poetry build` | Builds the source and wheels archives | `poetry build` |
| `poetry build --format wheel` | Builds only the wheel archive | `poetry build --format wheel` |
| `poetry build --format sdist` | Builds only the source archive | `poetry build --format sdist` |
| `poetry publish` | Publishes the package to PyPI | `poetry publish` |
| `poetry publish --build` | Builds and publishes the package | `poetry publish --build` |
| `poetry publish --repository` | Publishes to a specific repository | `poetry publish --repository my-repo` |
| `poetry publish --username --password` | Publishes with authentication | `poetry publish --username user --password pass` |

## Configuration and Information

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `poetry config --list` | Shows all configuration settings | `poetry config --list` |
| `poetry config [setting]` | Gets a specific configuration setting | `poetry config virtualenvs.in-project` |
| `poetry config [setting] [value]` | Sets a specific configuration setting | `poetry config virtualenvs.in-project true` |
| `poetry config [setting] --unset` | Unsets a specific configuration setting | `poetry config virtualenvs.path --unset` |
| `poetry --version` | Shows the Poetry version | `poetry --version` |
| `poetry about` | Shows information about Poetry | `poetry about` |
| `poetry help` | Shows help information | `poetry help` |
| `poetry help [command]` | Shows help for a specific command | `poetry help add` |

## Cache and Debugging

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `poetry cache list` | Lists all caches | `poetry cache list` |
| `poetry cache clear` | Clears Poetry's cache | `poetry cache clear --all` |
| `poetry cache clear [type]` | Clears a specific cache | `poetry cache clear PyPI` |
| `poetry debug info` | Shows debug information | `poetry debug info` |
| `poetry debug resolve` | Shows results of dependency resolution | `poetry debug resolve requests` |
| `poetry export` | Exports the lock file to requirements format | `poetry export -f requirements.txt -o requirements.txt` |
| `poetry export --dev` | Includes development dependencies in export | `poetry export --dev -f requirements.txt` |
| `poetry export --without-hashes` | Exports without hashes | `poetry export --without-hashes` |
| `poetry check` | Validates the pyproject.toml file | `poetry check` |

## Source Management

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `poetry source add` | Adds a source repository | `poetry source add private https://private.pypi.org/simple/` |
| `poetry source add --default` | Adds a default source repository | `poetry source add --default private https://private.pypi.org/simple/` |
| `poetry source add --secondary` | Adds a secondary source repository | `poetry source add --secondary private https://private.pypi.org/simple/` |
| `poetry source remove` | Removes a source repository | `poetry source remove private` |
| `poetry source show` | Shows source repositories | `poetry source show` |
