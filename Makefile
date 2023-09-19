
build:
	@bash .github/scripts/build.sh $(shell_name) $(shell_binary)

test:
	@bash .github/scripts/build.sh SH /bin/sh
	@bash .github/scripts/build.sh BASH /bin/bash

test-readme:
	@bash .github/scripts/readme.sh sps/if-statement-with-multiple-and-conditions