
build:
	@bash .github/scripts/build.sh SH /bin/sh
	@bash .github/scripts/build.sh BASH /bin/bash


test:
	@bash .github/scripts/build.sh

test-readme:
	@bash .github/scripts/readme.sh sps/if-statement-with-multiple-and-conditions