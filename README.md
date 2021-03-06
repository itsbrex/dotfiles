# dotfiles

This is me managing my Dotfiles, Brew Binaries, Mac Apps, ~~and VSCode extensions~~ forthcoming VST/AU Audio Plugins 馃攰

## Quickstart & Notes

Be sure to change all references of my `hack` home folder name to whatever yours is in all files in this repo.

```bash
git clone https://github.com/itsbrex/dotfiles.git
cd dotfiles
sh install.sh
```

## `sh install.sh`

This is the sauce...

- <details open>
    <summary><i>Output</i></summary>

    ```console
    馃嵒 Homebrew
        brew is installed

    鈿★笍 Powerline fonts
        Copying fonts...
        Powerline fonts installed to /Users/hack/Library/Fonts

    馃槷 Oh My Zsh
        Looks like Oh My Zsh is already installed

    馃敆 Copying/Symlinking dotfiles
        路 Linked Brewfile to /Users/hack/.Brewfile.
        路 Linked Brewfile.lock.json to /Users/hack/.Brewfile.lock.json.
        路 Linked gitconfig to /Users/hack/.gitconfig.
        路 Linked vimrc to /Users/hack/.vimrc.
        路 Linked zshrc to /Users/hack/.zshrc.


    馃挱 Run 'brew bundle'? [y/N] y
        Using homebrew/bundle
        Using homebrew/cask
        Using homebrew/core
        Using autojump
        Using awscli
        Using bat
        Using mas
        Using fnm
        Using fzf
        Using gh
        Using gnupg
        Using go
        Using kubectl
        Using neovim
        Using node
        Using ripgrep
        Using rust
        Using starship
        Using watchman
        Using 1password
        Using discord
        Using docker
        Using dropbox
        Using firefox
        Using google-chrome
        Using imageoptim
        Using istat-menus
        Using iterm2
        Using notion
        Using postman
        Using slack
        Using steam
        Using tableplus
        Using visual-studio-code
        Using zoom
        Using Compressor
        Using Final Cut Pro
        Using Magnet
        Using Xcode
        Homebrew Bundle complete! 39 Brewfile dependencies now installed.

    馃挱 Install VSCode extentions now? [y/N] y
        鉁? amazonwebservices.aws-toolkit-vscode
        鉁? apollographql.vscode-apollo
        鉁? bradlc.vscode-tailwindcss
        鉁? bradymholt.pgformatter
        鉁? ckolkman.vscode-postgres
        鉁? clinyong.vscode-css-modules
        鉁? codezombiech.gitignore
        鉁? csstools.postcss
        鉁? dbaeumer.vscode-eslint
        鉁? donjayamanne.githistory
        鉁? esbenp.prettier-vscode
        鉁? fwcd.kotlin
        鉁? GitHub.copilot
        鉁? GitHub.github-vscode-theme
        鉁? GitHub.vscode-pull-request-github
        鉁? golang.go
        鉁? GraphQL.vscode-graphql
        鉁? hashicorp.terraform
        鉁? hediet.vscode-drawio
        鉁? iocave.monkey-patch
        鉁? KnisterPeter.vscode-github
        鉁? MariusAlchimavicius.json-to-ts
        馃挜 matklad.rust-analyze
        鉁? mikestead.dotenv
        鉁? ms-azuretools.vscode-docker
        鉁? ms-kubernetes-tools.vscode-kubernetes-tools
        鉁? ms-python.python
        鉁? ms-toolsai.jupyter
        鉁? ms-vscode-remote.remote-containers
        馃挜 ms-vscode.typescript-javascript-grammar
        鉁? ms-vscode.vscode-typescript-next
        鉁? ms-vscode.vscode-typescript-tslint-plugin
        鉁? naumovs.color-highlight
        鉁? PKief.material-icon-theme
        鉁? Prisma.prisma
        鉁? redhat.vscode-commons
        鉁? redhat.vscode-yaml
        鉁? rust-lang.rust
        鉁? shakram02.bash-beautify
        鉁? shd101wyy.markdown-preview-enhanced
        鉁? silvenon.mdx
        鉁? streetsidesoftware.code-spell-checker
        鉁? tht13.html-preview-vscode
        鉁? Tyriar.lorem-ipsum
        鉁? VisualStudioExptTeam.vscodeintellicode
        鉁? vscjava.vscode-maven
        鉁? vscode-icons-team.vscode-icons
    ```

  </details>


## VSCode

**TODOS**
- [ ] Programmatically install `code` CLI
- [ ] Sync `~/.vscode/extentions`

### `code` CLI

Installing `code` CLI
- In VSCode, <kbd>鈱?</kbd> + <kbd>鈬?</kbd> + <kbd>p</kbd>, search: "install code"

### Allowing <kbd>鈱?</kbd> + <kbd>K</kbd> to clear the integrated terminal

In VSCode
- <kbd>鈱?</kbd> + <kbd>鈬?</kbd> + <kbd>p</kbd>
- search: ">Open Keyboard Shortcuts (JSON)"

```json
[
  {
    "key": "cmd+k",
    "command": "workbench.action.terminal.clear",
    "when": "terminalFocus && terminalProcessSupported"
  }
]
```

## Misc Machine Setup

### Map `Caps Lock` (<kbd>鈬?</kbd>) to `Control` (<kbd>鈱?</kbd>)

![image](https://user-images.githubusercontent.com/26389321/131413420-45915f24-b0d9-4107-9205-2a2bc9e795d8.png)

### Option <kbd>鈱?</kbd> + <kbd>Delete</kbd> should delete words in terminal

Option == Opt/Alt on HHKB
![image](https://user-images.githubusercontent.com/26389321/131890471-e80c74f4-2876-4390-bd80-1209618a0619.png)
