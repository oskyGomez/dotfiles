# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

TIMESTAMP=$(date "+%Y%m%d%H%M%S")

# Symlink dotfiles
read -p "Run dotfiles.sh? (y/n) " -n 1; echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  (sh scripts/dotfiles.sh) 2>&1 | tee -a dotfiles.$TIMESTAMP.log
fi;
