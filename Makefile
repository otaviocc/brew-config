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

CASKS_HOME ?= \
	affinity-designer \
	affinity-photo \
	affinity-publisher \
	alfred \
	appcleaner \
	bartender \
	dash \
	firefox \
	fujifilm-x-raw-studio \
	google-chrome \
	kaleidoscope \
	marsedit \
	microblog \
	monodraw \
	netnewswire \
	obsidian \
	paw \
	sf-symbols \
	sublime-text \
	taskpaper \
	tower \
	typora \
	xscope \
	yubico-authenticator

CASKS_WORK ?= \
	alfred \
	appcleaner \
	bartender \
	dash \
	google-chrome \
	kaleidoscope \
	monodraw \
	paw \
	sf-symbols \
	sublime-text \
	taskpaper \
	tower \
	xscope \
	yubico-authenticator \
	zoom

FONTS ?= \
	font-cascadia-code \
	font-cascadia-mono \
	font-jetbrains-mono \
	font-fira-code \
	font-fira-mono \
	font-fira-sans \
	font-sf-mono

.PHONY: $(TAPS)
.PHONY: $(PACKAGES_HOME)
.PHONY: $(CASKS_HOME)
.PHONY: $(CASKS_WORK)
.PHONY: $(FONTS)
.PHONY: UPDATE
.PHONY: CLEANUP
.PHONY: REBUILD

all: magic
home: $(TAPS) UPDATE UPGRADE UPGRADE_CASKS $(PACKAGES) $(CASKS_HOME) $(FONTS) CLEANUP
work: $(TAPS) UPDATE UPGRADE UPGRADE_CASKS $(PACKAGES) $(CASKS_WORK) $(FONTS) CLEANUP
magic: $(TAPS) UPDATE UPGRADE UPGRADE_CASKS CLEANUP
rebuild: REBUILD

$(TAPS):
	brew tap $@

$(PACKAGES):
	brew install $@

$(CASKS):
	brew install --no-quarantine --cask $@

$(FONTS):
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
