
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-/]=** r:|=** l:|=*'
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/pontus/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

export EDITOR=nvim
export VISUAL=nvim

bindkey -M viins 'jk' vi-cmd-mode
export KEYTIMEOUT=15

alias nv='nvim'
alias bvim='NVIM_APPNAME="nvim-backup" nvim'
alias cursor='/opt/cursor.AppImage --no-sandbox'


# Inline-suggestions from history
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi  # :contentReference[oaicite:3]{index=3}
bindkey '^ ' autosuggest-accept  # Ctrl+Space accepts suggestions

# History substring search on ↑/↓ (fish-isch)
if [ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
  source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
fi  # :contentReference[oaicite:4]{index=4}

# Syntax highlighting
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Ctrl-R fuzzy-search (fzf)
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ]   && source /usr/share/fzf/completion.zsh


# Created by `pipx` on 2025-09-20 11:55:32
export PATH="$PATH:/home/pontus/.local/bin"
eval "$(mise activate zsh)"
