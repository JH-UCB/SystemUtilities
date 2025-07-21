# pytest Commands Reference Table

## Basic Test Execution

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `pytest` | Runs all tests in current directory | `pytest` |
| `pytest [file]` | Runs tests in specific file | `pytest test_module.py` |
| `pytest [directory]` | Runs tests in directory | `pytest tests/` |
| `pytest [file]::[class]` | Runs tests in specific class | `pytest test_module.py::TestClass` |
| `pytest [file]::[function]` | Runs specific test function | `pytest test_module.py::test_function` |
| `pytest [file]::[class]::[method]` | Runs specific test method | `pytest test_module.py::TestClass::test_method` |
| `pytest -k [expression]` | Runs tests matching expression | `pytest -k "test_login or test_logout"` |
| `pytest -k "not [expression]"` | Excludes tests matching expression | `pytest -k "not slow"` |
| `pytest -m [marker]` | Runs tests with specific marker | `pytest -m "slow"` |
| `pytest -m "not [marker]"` | Excludes tests with marker | `pytest -m "not slow"` |
| `pytest --lf` | Runs last failed tests | `pytest --lf` |
| `pytest --ff` | Runs failed tests first | `pytest --ff` |
| `pytest -x` | Stops after first failure | `pytest -x` |
| `pytest --maxfail=[num]` | Stops after N failures | `pytest --maxfail=3` |
| `pytest --tb=short` | Shows shorter traceback | `pytest --tb=short` |
| `pytest --tb=line` | Shows one line per failure | `pytest --tb=line` |
| `pytest --tb=no` | Hides traceback | `pytest --tb=no` |

## Test Discovery and Collection

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `pytest --collect-only` | Shows which tests would run | `pytest --collect-only` |
| `pytest --co` | Short for collect-only | `pytest --co` |
| `pytest --ignore=[path]` | Ignores path during collection | `pytest --ignore=tests/integration/` |
| `pytest --ignore-glob=[pattern]` | Ignores paths matching pattern | `pytest --ignore-glob="*_slow.py"` |
| `pytest --deselect=[item]` | Deselects specific test item | `pytest --deselect=test_module.py::test_function` |
| `pytest --doctest-modules` | Runs doctests in modules | `pytest --doctest-modules` |
| `pytest --doctest-glob=[pattern]` | Runs doctests in files matching pattern | `pytest --doctest-glob="*.rst"` |
| `pytest --pyargs [package]` | Tests installed package | `pytest --pyargs mypackage` |

## Output and Reporting

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `pytest -v` | Verbose output | `pytest -v` |
| `pytest -vv` | More verbose output | `pytest -vv` |
| `pytest -q` | Quiet output | `pytest -q` |
| `pytest -s` | No capture (shows print statements) | `pytest -s` |
| `pytest --capture=no` | Disables output capturing | `pytest --capture=no` |
| `pytest -r[chars]` | Shows extra test summary | `pytest -rA` (all), `-rf` (failed) |
| `pytest --tb=[style]` | Traceback print mode | `pytest --tb=short` |
| `pytest --show-capture=no` | Hides captured output | `pytest --show-capture=no` |
| `pytest --durations=[N]` | Shows N slowest tests | `pytest --durations=10` |
| `pytest --durations-min=[N]` | Shows tests slower than N seconds | `pytest --durations-min=1.0` |
| `pytest --junit-xml=[path]` | Generates JUnit XML report | `pytest --junit-xml=report.xml` |
| `pytest --html=[path]` | Generates HTML report (needs pytest-html) | `pytest --html=report.html` |
| `pytest --self-contained-html` | Embeds CSS/JS in HTML report | `pytest --html=report.html --self-contained-html` |
| `pytest --log-cli-level=[LEVEL]` | Sets CLI logging level | `pytest --log-cli-level=DEBUG` |

## Fixtures and Setup

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `pytest --fixtures` | Shows available fixtures | `pytest --fixtures` |
| `pytest --fixtures-per-test` | Shows fixtures per test | `pytest --fixtures-per-test` |
| `pytest --setup-only` | Only runs setup/teardown | `pytest --setup-only` |
| `pytest --setup-show` | Shows setup/teardown execution | `pytest --setup-show` |
| `pytest --setup-plan` | Shows setup plan without execution | `pytest --setup-plan` |

## Markers and Attributes

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `pytest --markers` | Shows available markers | `pytest --markers` |
| `pytest -m [marker]` | Runs tests with marker | `pytest -m slow` |
| `pytest -m "[expr1] and [expr2]"` | Combines markers with AND | `pytest -m "slow and integration"` |
| `pytest -m "[expr1] or [expr2]"` | Combines markers with OR | `pytest -m "slow or flaky"` |
| `pytest -m "not [marker]"` | Excludes marked tests | `pytest -m "not slow"` |
| `pytest --strict-markers` | Treats unregistered markers as errors | `pytest --strict-markers` |

## Parallel Execution (pytest-xdist)

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `pytest -n [NUM]` | Runs tests in parallel | `pytest -n 4` |
| `pytest -n auto` | Auto-detects CPU count | `pytest -n auto` |
| `pytest --dist=[mode]` | Distribution mode | `pytest -n 2 --dist=loadscope` |
| `pytest --tx=[spec]` | Adds test execution environment | `pytest --tx=popen//python=python3.9` |
| `pytest -d` | Distributed testing mode | `pytest -d` |
| `pytest --rsyncdir=[dir]` | Syncs directory to remote workers | `pytest --rsyncdir=mypackage` |

## Coverage (pytest-cov)

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `pytest --cov=[module]` | Measures coverage for module | `pytest --cov=mypackage` |
| `pytest --cov-report=[type]` | Coverage report type | `pytest --cov-report=html` |
| `pytest --cov-report term` | Terminal coverage report | `pytest --cov=mypackage --cov-report=term` |
| `pytest --cov-report html` | HTML coverage report | `pytest --cov=mypackage --cov-report=html` |
| `pytest --cov-report xml` | XML coverage report | `pytest --cov=mypackage --cov-report=xml` |
| `pytest --cov-fail-under=[MIN]` | Fails if coverage below minimum | `pytest --cov=mypackage --cov-fail-under=80` |
| `pytest --cov-branch` | Enables branch coverage | `pytest --cov=mypackage --cov-branch` |
| `pytest --cov-append` | Appends to existing coverage data | `pytest --cov-append` |
| `pytest --no-cov` | Disables coverage | `pytest --no-cov` |

## Configuration and Cache

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `pytest --cache-show` | Shows cache contents | `pytest --cache-show` |
| `pytest --cache-clear` | Clears cache before test run | `pytest --cache-clear` |
| `pytest -p no:[plugin]` | Disables plugin | `pytest -p no:warnings` |
| `pytest -p [plugin]` | Enables plugin | `pytest -p pytest_timeout` |
| `pytest --trace-config` | Shows config file parsing | `pytest --trace-config` |
| `pytest --override-ini=[option]` | Overrides ini option | `pytest --override-ini="addopts=-vv"` |
| `pytest -c [file]` | Uses specific config file | `pytest -c pytest-integration.ini` |
| `pytest --rootdir=[path]` | Sets root directory | `pytest --rootdir=/path/to/project` |

## Debugging and Development

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `pytest --pdb` | Enters debugger on failure | `pytest --pdb` |
| `pytest --pdbcls=[module]` | Uses custom debugger class | `pytest --pdbcls=IPython.terminal.debugger:TerminalPdb` |
| `pytest --trace` | Enters debugger at start of each test | `pytest --trace` |
| `pytest --capture=no` | Disables output capturing for debugging | `pytest -s` |
| `pytest --log-cli-level=DEBUG` | Shows debug logs during test | `pytest --log-cli-level=DEBUG` |
| `pytest --basetemp=[path]` | Sets base temporary directory | `pytest --basetemp=/tmp/pytest` |
| `pytest --assert=plain` | Disables assertion introspection | `pytest --assert=plain` |
| `pytest --no-header` | Hides pytest header | `pytest --no-header` |
| `pytest --no-summary` | Hides test summary | `pytest --no-summary` |

## Test Parametrization

| Command | Description | Example Usage |
|---------|-------------|---------------|
| `pytest -k [param_value]` | Runs specific parametrized test | `pytest -k "test_func[value1]"` |
| `pytest --collect-only` | Shows parametrized test variants | `pytest --collect-only test_param.py` |

## Pytest Fixtures (in code)

| Feature | Description | Example Usage |
|---------|-------------|---------------|
| `@pytest.fixture` | Defines a fixture | `@pytest.fixture`<br>`def my_fixture():`<br>`    return "data"` |
| `@pytest.fixture(scope="...")` | Sets fixture scope | `@pytest.fixture(scope="session")`<br>`def db():` |
| `@pytest.fixture(autouse=True)` | Auto-uses fixture | `@pytest.fixture(autouse=True)`<br>`def setup():` |
| `@pytest.fixture(params=[...])` | Parametrizes fixture | `@pytest.fixture(params=[1, 2, 3])`<br>`def number(request):`<br>`    return request.param` |
| `@pytest.fixture(name="...")` | Custom fixture name | `@pytest.fixture(name="db")`<br>`def database_fixture():` |
| `yield` in fixture | Fixture with teardown | `@pytest.fixture`<br>`def resource():`<br>`    res = acquire()`<br>`    yield res`<br>`    cleanup(res)` |

## Pytest Markers (in code)

| Feature | Description | Example Usage |
|---------|-------------|---------------|
| `@pytest.mark.[name]` | Applies custom marker | `@pytest.mark.slow`<br>`def test_function():` |
| `@pytest.mark.skip` | Skips test | `@pytest.mark.skip(reason="Not implemented")`<br>`def test_function():` |
| `@pytest.mark.skipif` | Conditional skip | `@pytest.mark.skipif(sys.version_info < (3, 8), reason="Requires Python 3.8+")`<br>`def test_function():` |
| `@pytest.mark.xfail` | Expected failure | `@pytest.mark.xfail(reason="Known bug")`<br>`def test_function():` |
| `@pytest.mark.parametrize` | Parametrizes test | `@pytest.mark.parametrize("input,expected", [(1, 2), (2, 4)])`<br>`def test_double(input, expected):` |
| `@pytest.mark.usefixtures` | Uses fixtures | `@pytest.mark.usefixtures("db", "cache")`<br>`def test_function():` |
| `@pytest.mark.filterwarnings` | Filters warnings | `@pytest.mark.filterwarnings("ignore:deprecated")`<br>`def test_function():` |
| `@pytest.mark.timeout` | Sets timeout (needs pytest-timeout) | `@pytest.mark.timeout(10)`<br>`def test_slow_function():` |

## Common Configuration Files

| File | Description | Example Content |
|---------|-------------|---------------|
| `pytest.ini` | Main configuration file | `[pytest]`<br>`addopts = -v --strict-markers`<br>`testpaths = tests`<br>`python_files = test_*.py` |
| `pyproject.toml` | Alternative config location | `[tool.pytest.ini_options]`<br>`addopts = "-v"`<br>`testpaths = ["tests"]` |
| `tox.ini` | Can contain pytest config | `[pytest]`<br>`addopts = -v` |
| `setup.cfg` | Can contain pytest config | `[tool:pytest]`<br>`addopts = -v` |
| `conftest.py` | Shared fixtures and configuration | `import pytest`<br><br>`@pytest.fixture(scope="session")`<br>`def db():`<br>`    # setup database`<br>`    pass` |