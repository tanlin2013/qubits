#!/bin/bash
set -euxo pipefail

poetry run cruft check
poetry run safety check -i 39462 -i 40291
poetry run bandit -c pyproject.toml -r qubits/
poetry run isort --check --diff qubits/ tests/
poetry run black --check qubits/ tests/
poetry run flake8 qubits/ tests/
poetry run mypy \
           --install-types \
           --non-interactive \
           qubits/
#  https://mypy.readthedocs.io/en/stable/running_mypy.html#library-stubs-not-installed
