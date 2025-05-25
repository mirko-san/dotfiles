# dotfiles

## requirement

- zsh
- zinit
- [chezmoi](https://www.chezmoi.io/)

## usage

```
chezmoi update
```

### nvim

nvim を起動したら以下を実行して vim-plug で管理しているプラグインをインストールする。

```
:PlugInstall
```

#### ショートカットメモ

##### nvim-cmp

コードの補完機能関係のショートカット

- `<C-p>`, `<C-n>`: 補完の選択 preview, next
- `<C-b>`, `<C-f>`: 補完のページング 前ページ次ページ
- `<C-Space>`: 補完呼び出し
- `<C-e>`: 補完の中断
- `<CR>`: 補完の決定

##### fern

ファイルビューワのショートカット

- `<C-n>`: ファイルビューワの表示(トグル)
