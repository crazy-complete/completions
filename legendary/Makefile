CRAZY_COMPLETE ?= crazy-complete

all: bash fish zsh

bash:
	mkdir -p generated/bash
	
	$(CRAZY_COMPLETE) \
		--include-file=legendary.bash \
		--inherit-options=True \
		-o generated/bash/legendary \
		bash legendary.yaml

fish:
	mkdir -p generated/fish
	
	$(CRAZY_COMPLETE) \
		--include-file=legendary.fish \
		--inherit-options=True \
		-o generated/fish/legendary.fish \
		fish legendary.yaml 

zsh:
	mkdir -p generated/zsh
	
	$(CRAZY_COMPLETE) \
		--include-file=legendary.zsh \
		--inherit-options=True \
		-o generated/zsh/_legendary \
		zsh legendary.yaml 
	
	$(CRAZY_COMPLETE) \
		--include-file=legendary.zsh \
		--inherit-options=True \
		--zsh-compdef=False \
		-o generated/zsh/legendary.sourceable \
		zsh legendary.yaml

clean:
	rm -rf generated
