#!/usr/bin/env bash
#
# This installation is destructive, as it removes exisitng files/directories.
# Use at your own risk.
#
# This script builds on top of https://github.com/mitchellh/dotfiles

echo ""

# Install Homebrew
echo "🍻 Homebrew"
which -s brew
if [[ $? != 0 ]] ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "\tbrew is installed"
fi
echo ""

# Run these two commands in your terminal to add Homebrew to your PATH:
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/hack/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Rust
echo "🦀 Rust"
which -s rustup
if [[ $? != 0 ]] ; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo "\rustup is installed"
fi
echo ""

which -s wasm-pack
if [[ $? != 0 ]] ; then
  # Fails for M1 Macs
  curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
  if [[ $? != 0 ]] ; then
    cargo install wasm-pack
  fi
else
  echo "\wasm-pack is installed"
fi
echo ""


# Install Oh My Zsh
echo "😮 Oh My Zsh"
ZSH_CUSTOM_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom/}/plugins/zsh-autosuggestions
ZSH_AUTOSUGGESTIONS=https://github.com/zsh-users/zsh-autosuggestions
if [[ -d $ZSH_CUSTOM_DIR ]]
then
  echo "\tLooks like Oh My Zsh is already installed"
else
  echo "\tCloning $ZSH_AUTOSUGGESTIONS"
  git clone $ZSH_AUTOSUGGESTIONS $ZSH_CUSTOM_DIR
fi
echo ""

# Get path to the current script
SCRIPT_NAME="$(basename ${BASH_SOURCE[0]})"
pushd $(dirname ${BASH_SOURCE[0]}) > /dev/null
SCRIPT_DIR=$(pwd)
popd > /dev/null

# names in this list won't be dot-prefixed
skip_dot_prefix=(nvim, starship.toml)

# contains checks if an array ($2) contains a given element ($1).
contains() {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}


# copy or symlink all the dotfiles
echo "🔗 Copying/Symlinking dotfiles"
UNAME=$(uname | tr '[:upper:]' '[:lower:]')
for path in $SCRIPT_DIR/*; do
  name=$(basename $path)
  case $name in
    *.md|*.sh) continue;;
  esac

  # If there exists a platform-specific version, then use that
  if [ -e "${path}.${UNAME}" ]; then
    echo "Using platform-specific ${name} for ${UNAME}"
    path="${path}.${UNAME}"
  fi

  # If the file is in the skip dot list, then we don't add a dot
  target="$name"
  if ! contains "$name" "${skip_dot_prefix[@]}"; then
    target=".$name"
  fi

  # Build our complete path to the home directory
  target="$HOME/$target"
  if [ -h $target -o -f $target ]; then
    rm $target
  elif [ -d $target ]; then
    rm -rf $target
  fi

  case $UNAME in
    cygwin* | mingw32*)
      cp -R $path "$target"
      echo "\t· Copied $name to $target."
      ;;
    *)
      ln -s $path "$target"
      echo "\t· Linked $name to $target."
      ;;
  esac
done
echo ""

# # setup the vim directory
# pushd $HOME >/dev/null
# if [ ! -d ".vim/bundle" ]; then
#   echo "Installing Vim plugins"
#   mkdir -p .vim .vim/bundle .vim/backup .vim/swap .vim/cache .vim/undo
#   curl -fLo .vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#   TERM=dumb vim +PlugInstall +qall >vim.log 2>&1
# fi
# popd >/dev/null
# echo ""

##################
# Optional stuff #
##################

powerline_fonts() {
  # Install Powerline fonts
  printf "⚡️ Install Powerline fonts? "
  read -r -p "[y/N] " response
  case $response in
    [yY][eE][sS]|[yY])
    git clone https://github.com/powerline/fonts.git --depth=1 --quiet
    pushd fonts >/dev/null
    ./install.sh | sed 's/^/\t/'
    popd >/dev/null
    rm -rf fonts
    break;;
    *) echo "\tSkipping..."; 
    break;;
  esac
  echo ""
}



# Brew
brew_bundle() {
  printf "💭 Run 'brew bundle'? "
  read -r -p "[y/N] " response
  case $response in
    [yY][eE][sS]|[yY])
    brew bundle | sed 's/^/\t/'
    break;;
    *) echo "\tSkipping..."; 
    break;;
  esac
  echo ""
}

# vscode_extensions() {
#   # VScode extentions
#   # Check for code CLI
#   printf "💭 Install VSCode extentions now? "
#   which -s code
#   if [[ $? != 0 ]] ; then
#     echo "\n\tcode cli is not installed";
#     echo "\n\tskipping for now..."
#   else
#     read -r -p "[y/N] " response
#     case $response in
#       [yY][eE][sS]|[yY])
#       sh ./.vscode/install-extensions.sh | sed 's/^/\t/'
#       break;;
#       *) echo "\tSkipping..."; 
#       break;;
#     esac
#   fi
#   echo ""
# }

powerline_fonts
brew_bundle
# vscode_extensions

# # gpg (depends on gnupg being installed)
# echo "🔑 GPG"

# git config --global gpg.program $(which gpg)

# if [[ ! -e ~/.gnupg/gpg-agent.conf ]]; then
#   touch ~/.gnupg/gpg-agent.conf
#   echo "default-cache-ttl 46000" >> ~/.gnupg/gpg-agent.conf
#   echo "max-cache-ttl 46000" >> ~/.gnupg/gpg-agent.conf
#   echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf
# fi

# printf "\t"; gpg-agent;
# if [[ $? != 0 ]] ; then
#   echo "\t♻️ starting new gpg-agent"
#   gpg-agent --daemon
#   wait
# fi