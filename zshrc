# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# Add Tex Live 2025 paths to environment variables
export MANPATH=$MANPATH:/usr/local/texlive/2025/texmf-dist/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2025/texmf-dist/doc/info
export PATH=$PATH:/usr/local/texlive/2025/bin/x86_64-linux

#DISABLE_AUTO_TITLE="False"
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

if [ "`tty | grep pts`" ];
then


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
export LIBVA_DRIVER_NAME=iHD
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh

fi

source ~/.zsh_hist.zsh


plugins=(
  git
	)

#To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
function Pon(){

	export all_proxy=socks5h://127.0.0.1:1080

}

function Poff(){

 	unset all_proxy
 
}


mal() {
  if [[ $BUFFER == *" please" ]]; then
    BUFFER='sudo '${BUFFER%please*}
  fi
  zle .accept-line
}
zle -N accept-line mal

# git 自动补全
zstyle ':completion:*:*:git:*' script ~/.config/Script/.git-completion.zsh
fpath=(~/.zsh_fpath $fpath)
autoload -Uz compinit && compinit


## go proxy
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.io,direct
#

#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx
#export XMODIFIERS=@im=fcitx

alias ls='ls --color=auto'
alias l="ls -la --color=auto"
alias grep='grep --color=auto'
alias v=nvim
alias vi=nvim
alias tm="tmux set -g mouse on"
alias tat="tmux attach"
alias tde="tmux detach"
alias n="neofetch"

alias op_start="openvpn3 session-start --config /home/zxy/Downloads/op/stu_VPN.ovpn"
alias op_log="openvpn3 log --config /home/zxy/Downloads/op/stu_VPN.ovpn"
alias op_end="openvpn3 session-manage -D --config /home/zxy/Downloads/op/stu_VPN.ovpn"
#alias ssl="ss-local -c /home/zxy/.ssr.cjson"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ZSH_THEME_TERM_TITLE_IDLE="%~ Alacritty"

# eval "$(fzf --zsh)"
