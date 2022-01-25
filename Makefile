all: shellcheck shfmt

shellcheck:
	bash ./scripts/shellcheck.bash

shfmt:
	bash ./scripts/shfmt.bash
