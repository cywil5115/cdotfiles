TARGET := $(HOME)

PACKAGES := $(shell find . -maxdepth 1 -type d \
	-not -name '.*' \
	-not -name '.' \
	-not -name '.git' \
	-exec basename {} \;)

STOW := stow --target=$(TARGET)

.PHONY: init restow unstow dry help

init:
	$(STOW) $(PACKAGES)

restow:
	$(STOW) --restow $(PACKAGES)

unstow:
	$(STOW) --delete $(PACKAGES)

dry:
	$(STOW) -n -v $(PACKAGES)

help:
	@echo "Available targets:"
	@echo "  init     - Initial stow of all packages"
	@echo "  restow   - Update existing links (--restow)"
	@echo "  unstow   - Remove all links from packages (--delete)"
	@echo "  dry      - Preview what Stow would do without making changes"
	@echo "  help     - Display this help message"
