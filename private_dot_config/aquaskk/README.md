# Usage

Aqua SKK 4.5.7 のとき、設定ファイルは `~/Library/Application\ Support/AquaSKK` を参照している。
初回のみ `chezmoi apply` を実行したのちに以下を実行すること。

```
$ ln -s ~/.config/aquaskk/act.conf  ~/Library/Application\ Support/AquaSKK/act.conf
$ ln -s ~/.config/aquaskk/keymap.conf ~/Library/Application\ Support/AquaSKK/keymap.conf
$ ln -s ~/.config/aquaskk/kana-rule.conf ~/Library/Application\ Support/AquaSKK/kana-rule.conf
```
