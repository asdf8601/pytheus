# variables
PYVER  := 3.10
python := uv run python
uv     := uv


##@ Utility
.PHONY: help
help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make <target>\033[36m\033[0m\n"} /^[a-zA-Z\._-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)


##@ Setup
.PHONY: install
install:  ## install dependencies
	$(uv) sync

.PHONY: sync
sync:  ## sync dependencies with uv.lock
	$(uv) sync


.PHONY: push
push: tag ## push to origin a new tag, e.g. make push v=<version>
	git push origin main
	git push --tags


##@ Development
.PHONY: dev
dev:  ## install dev dependencies
	$(uv) sync --group dev

.PHONY: test
test:  ## run tests
	$(uv) run pytest tests

.PHONY: lint
lint:  ## run linting check
	$(uv) run ruff check .

.PHONY: format
format:  ## format code with ruff
	$(uv) run ruff check --fix .
	$(uv) run ruff format .


.PHONY: lock
lock:  ## update uv.lock file
	$(uv) lock

.PHONY: add
add:  ## add a dependency, e.g. make add pkg=requests
	$(uv) add $(pkg)

.PHONY: remove
remove:  ## remove a dependency, e.g. make remove pkg=requests
	$(uv) remove $(pkg)
