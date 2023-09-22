
build:
	@bash .github/scripts/build.sh $(shell_name) $(shell_binary)

ci-pull:
	@git config --global user.email "ci@github.com"
	@git config --global user.name "GitHub CI"
	@git commit -am "Update" || true
	@git pull -X theirs --no-edit --no-rebase || true

test:
	@bash .github/scripts/build.sh SH /bin/sh
	@bash .github/scripts/build.sh BASH /bin/bash

test-readme:
	@bash .github/scripts/readme.sh sps/if-statement-with-multiple-and-conditions
