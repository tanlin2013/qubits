#!/bin/bash
set -euxo pipefail

./scripts/lint.sh
poetry run pytest -s --cov=qubits/ --cov=tests --cov-report=term-missing ${@-} --cov-report html
