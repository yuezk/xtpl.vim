# xtpl.vim

XTemplate Syntax file for Vim

仿照 [vim-mustache-handlebars][handlebar] 这个项目，实现了对 XTemplate 的语法高亮。

## 如何安装

使用 [Vundle][vundle]:

```
Plugin 'yuezk/xtpl.vim'
```

使用 [vim-plug][plug]:

```
Plug 'yuezk/xtpl.vim'
```

使用 [NeoBundle][bundle]:

```
NeoBundle 'yuezk/xtpl.vim'
```

## Changelog

### 2017-02-13

- improve indent


### 2016-05-02

- 修复 `<script type="text/xtpl"></script>` 中的 HTML 标签不高亮的问题
- 精简 xtpl.vim，不再兼容旧版本的 Vim
- 优化注释的高亮
- 优化 `{{% %}}` 区块的高亮

### 2016-04-30

- 修改部分语法高亮不正确的问题

### 2016-04-27

 - 实现常用语法高亮功能，首次提交

[handlebar]: https://github.com/mustache/vim-mustache-handlebars
[vundle]: https://github.com/gmarik/vundle
[plug]: https://github.com/junegunn/vim-plug
[bundle]: https://github.com/Shougo/neobundle.vim
