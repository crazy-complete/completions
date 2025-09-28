CRAZY_COMPLETE ?= crazy-complete

all: bash fish zsh

bash:
	mkdir -p generated/bash
	
	$(CRAZY_COMPLETE) \
		--include-file=legendary.bash \
		-o generated/bash/_legendary \
		bash legendary.yaml

fish:
	mkdir -p generated/fish
	
	$(CRAZY_COMPLETE) \
		--include-file=legendary.fish \
		-o generated/fish/legendary.fish \
		fish legendary.yaml 

zsh:
	mkdir -p generated/zsh
	
	$(CRAZY_COMPLETE) \
		--include-file=legendary.zsh \
		-o generated/zsh/legendary \
		zsh legendary.yaml 
	
	$(CRAZY_COMPLETE) \
		--include-file=legendary.zsh \
		--zsh-compdef=False \
		-o generated/zsh/legendary.sourceable \
		zsh legendary.yaml

clean:
	rm -rf generated
