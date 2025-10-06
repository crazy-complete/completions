CRAZY_COMPLETE ?= crazy-complete

all: bash fish zsh

# =============================================================================
# Script generation
# =============================================================================

bash: vlc.json
	mkdir -p generated/bash
	$(CRAZY_COMPLETE) -o generated/bash/vlc bash vlc.json

fish: vlc.json
	mkdir -p generated/fish
	$(CRAZY_COMPLETE) --disable=repeatable,final --fish-fast=True -o generated/fish/vlc.fish fish vlc.json

zsh: vlc.json
	mkdir -p generated/zsh
	$(CRAZY_COMPLETE) -o generated/zsh/_vlc zsh vlc.json
	$(CRAZY_COMPLETE) --zsh-compdef=False -o generated/zsh/vlc.sourceable zsh vlc.json

# =============================================================================
# YAML / JSON generation
# =============================================================================

vlc.json: vlc.yaml
	$(CRAZY_COMPLETE) json vlc.yaml -o vlc.json

vlc.yaml: update_yaml.py vlc.from_help.yaml
	./update_yaml.py vlc.from_help.yaml vlc.yaml

vlc.from_help.yaml: vlc.help.txt
	$(CRAZY_COMPLETE) --input-type=help yaml vlc.help.txt -o vlc.from_help.yaml

vlc.help.txt:
	vlc -H > vlc.help.txt

# =============================================================================
# Cleanup
# =============================================================================

clean:
	rm -f  vlc.help.txt vlc.from_help.yaml
	rm -rf generated

clean-all: clean
	rm -f vlc.json vlc.yaml
