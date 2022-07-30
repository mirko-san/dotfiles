# 分割ファイルの読み込み
ZSHHOME="${HOME}/.zsh"

if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

source $ZPLUG_HOME/init.zsh

zplug 'asdf-vm/asdf'

zplug "zsh-users/zsh-completions"
# 入力途中に候補をうっすら表示
zplug "zsh-users/zsh-autosuggestions"
# コマンドを種類ごとに色付け
zplug "zsh-users/zsh-syntax-highlighting"
zplug "atusy/gh-fzf"
zplug "migutw42/zsh-fzf-ghq"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

source $ZPLUG_REPOS/asdf-vm/asdf/asdf.sh
source $ZPLUG_REPOS/asdf-vm/asdf/completions/asdf.bash

eval "$(starship init zsh)"
