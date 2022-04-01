TAPS ?= \
	homebrew/cask-fonts \
	homebrew/cask-drivers

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
	sf-symbols \
	sublime-text \
	taskpaper \
	tower \
	xscope \
	yubico-authenticator

FONTS ?= \
	font-cascadia-code \
	font-cascadia-mono \
	font-jetbrains-mono \
	font-fira-code \
	font-fira-mono \
	font-fira-sans \
	font-sf-mono

.PHONY: $(TAPS)
.PHONY: $(PACKAGES)
.PHONY: $(CASKS)
.PHONY: $(FONTS)
.PHONY: UPDATE
.PHONY: CLEANUP
.PHONY: REBUILD

all: magic
install: $(TAPS) UPDATE UPGRADE UPGRADE_CASKS $(PACKAGES) $(CASKS) $(FONTS) CLEANUP
magic: $(TAPS) UPDATE UPGRADE UPGRADE_CASKS CLEANUP
rebuild: REBUILD

$(TAPS):
	brew tap $@

$(PACKAGES):
	brew install --no-quarantine $@

$(CASKS):
	brew install --no-quarantine --cask $@

$(FONTS):
	brew install --no-quarantine --cask $@

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
