source ~/.zplug/init.zsh

zplug "modules/prompt", from:prezto
zplug 'asdf-vm/asdf'

zplug "atusy/gh-fzf"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

prompt giddie

source $ZPLUG_REPOS/asdf-vm/asdf/asdf.sh
source $ZPLUG_REPOS/asdf-vm/asdf/completions/asdf.bash

# 分割ファイルの読み込み
ZSHHOME="${HOME}/.zsh"

if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

