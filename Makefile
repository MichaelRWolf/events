.PHONY: setup-hooks
setup-hooks:
	pre-commit install

.PHONY: test-ics
test-ics:
	@bash ./scripts/test-ics.sh
