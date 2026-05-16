# rbs-ts-mode

`rbs-ts-mode` is a tree-sitter-backed major mode for editing
[RBS](https://github.com/ruby/rbs) files in Emacs.

It currently builds on top of
[`rbs-mode`](https://github.com/ybiquitous/rbs-mode), reusing its existing
editing behavior while adding native tree-sitter support.

## Requirements

- Emacs 30 or later
- `rbs-mode`
- The `rbs` tree-sitter grammar

## Installation

Clone the repository and add it to `load-path`:

```elisp
(add-to-list 'load-path "/path/to/rbs-ts-mode.el")
(require 'rbs-ts-mode)
```

When the package is loaded, `.rbs` files are associated with `rbs-ts-mode`.

The RBS grammar can be installed with Emacs tree-sitter support, for example:

```elisp
(add-to-list 'treesit-language-source-alist
             '(rbs "https://github.com/joker1007/tree-sitter-rbs"))
(treesit-install-language-grammar 'rbs)
```

## Status

This project is still small and experimental. At the moment it provides the
`rbs-ts-mode` major mode and tree-sitter-backed comment highlighting while
continuing to rely on `rbs-mode` for the rest of the editing behavior.

## License

GPL-3.0-or-later. See [LICENSE](LICENSE).
