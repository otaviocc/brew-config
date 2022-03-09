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

.PHONY: $(PACKAGES)
.PHONY: $(CASKS)
.PHONY: UPDATE
.PHONY: CLEANUP
.PHONY: MAGIC

all: MAGIC
install: UPDATE UPGRADE UPGRADE_CASKS $(PACKAGES) $(CASKS) CLEANUP

$(PACKAGES):
	brew install $@

$(CASKS):
	brew install --cask $@

UPDATE:
	brew update --verbose

UPGRADE:
	brew upgrade --verbose

UPGRADE_CASKS:
	brew upgrade --cask --greedy --verbose

CLEANUP:
	brew cleanup --verbose

MAGIC: UPDATE UPGRADE UPGRADE_CASKS CLEANUP
