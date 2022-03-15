PACKAGES ?= \
	ack \
	exiftool \
	fish \
	gnupg \
	mint \
 	pinentry-mac \
  	tig \
  	wget

CASKS ?= \
	affinity-designer \
	affinity-photo \
	affinity-publisher \
	alfred \
	appcleaner \
	bartender \
	dash \
	firefox \
	google-chrome \
	kaleidoscope \
	microblog \
	monodraw \
	netnewswire \
	obsidian \
	paw \
	sublime-text \
	tower \
	xscope

FONTS ?= \
	font-cascadia-code \
	font-cascadia-mono \
	font-jetbrains-mono \
	font-fira-code \
	font-fira-mono \
	font-fira-sans \
	font-sf-mono

.PHONY: $(PACKAGES)
.PHONY: $(CASKS)
.PHONY: $(FONTS)
.PHONY: UPDATE
.PHONY: CLEANUP
.PHONY: REBUILD

all: magic
install: UPDATE UPGRADE UPGRADE_CASKS $(PACKAGES) $(CASKS) $(FONTS) CLEANUP
magic: UPDATE UPGRADE UPGRADE_CASKS CLEANUP
rebuild: REBUILD

$(PACKAGES):
	brew install $@

$(CASKS):
	brew install --cask $@

$(FONTS):
	brew tap homebrew/cask-fonts
	brew install --cask $@

UPDATE:
	brew update --verbose

UPGRADE:
	brew upgrade --verbose

UPGRADE_CASKS:
	brew upgrade --cask --greedy --verbose

CLEANUP:
	brew cleanup --verbose

REBUILD:
	defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock