CRAZY_COMPLETE ?= crazy-complete

all: bash fish zsh

# =============================================================================
# Script generation
# =============================================================================

bash: fpm.yaml
	mkdir -p generated/bash
	$(CRAZY_COMPLETE) -o generated/bash/fpm bash fpm.yaml

fish: fpm.yaml
	mkdir -p generated/fish
	$(CRAZY_COMPLETE) --disable=repeatable,final --fish-fast=True -o generated/fish/fpm.fish fish fpm.yaml

zsh: fpm.yaml
	mkdir -p generated/zsh
	$(CRAZY_COMPLETE) -o generated/zsh/_fpm zsh fpm.yaml
	$(CRAZY_COMPLETE) --zsh-compdef=False -o generated/zsh/fpm.sourceable zsh fpm.yaml

# =============================================================================
# YAML generation
# =============================================================================

fpm.yaml: generate_from_help.py
	./generate_from_help.py > fpm.yaml

# =============================================================================
# Cleanup
# =============================================================================

clean:
	rm -rf generated
