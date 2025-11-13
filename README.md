# Pytheus

A hacky CLI tool for getting data from Prometheus.

## Installation

### Using pipx (recommended)
```bash
pipx install git+https://github.com/mmngreco/pytheus
```

### Using uv (for development)
```bash
# Install uv if you don't have it
curl -LsSf https://astral.sh/uv/install.sh | sh

# Clone and install
git clone https://github.com/mmngreco/pytheus
cd pytheus
uv sync --group dev
```

## Usage

```bash
export PYTHEUS_API_URL="https://prometheus/api/v1"
pytheus --start "2024-02-04 00:05" --end "2024-03-05 00:00" --query "sum (rate(metrics{group='g1'}[60m]))" --cookie ./cookie --silent
```

## Development

```bash
# Install dependencies
make dev

# Run tests
make test

# Format code
make format

# Lint
make lint
```
