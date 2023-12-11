#!/bin/bash
set -euxo pipefail

poetry run isort qubits/ tests/
poetry run black qubits/ tests/
