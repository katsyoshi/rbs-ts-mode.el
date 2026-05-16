;;; rbs-ts-mode.el --- Tree-sitter mode for RBS -*- lexical-binding: t; -*-

;; Package-Requires: ((emacs "30.1") (rbs-mode "1.0.0"))
;; Author: katsyoshi
;; Keywords: languages, tools

(require 'rbs-mode)
(require 'treesit)

(defconst rbs-ts-mode--font-lock-settings
  (treesit-font-lock-rules
   :language 'rbs
   :feature 'comment
   '((comment) @font-lock-comment-face)

   :language 'rbs
   :feature 'definition
   '((class_decl
      name: (class_name (constant) @font-lock-type-face))
     (module_decl
      name: (module_name (constant) @font-lock-type-face))
     (interface_decl
      name: (interface_name) @font-lock-type-face)
     (type_alias_decl
      (alias_name) @font-lock-type-face)
     (method_member
      name: (method_name) @font-lock-function-name-face))

   :language 'rbs
   :feature 'constant
   '((const_decl
      (const_name (constant) @font-lock-constant-face)))

   :language 'rbs
   :feature 'type
   '((class_name (constant) @font-lock-type-face)
     (type_name (constant) @font-lock-type-face)
     (namespace (constant) @font-lock-type-face)
     (builtin_type) @font-lock-builtin-face)

   :language 'rbs
   :feature 'variable
   '((ivar_name) @font-lock-variable-name-face
     (keyword (identifier) @font-lock-variable-name-face))

   :language 'rbs
   :feature 'keyword
   '(["alias"
      "attr_accessor"
      "attr_reader"
      "attr_writer"
      "class"
      "def"
      "end"
      "extend"
      "in"
      "include"
      "interface"
      "module"
      "out"
      "prepend"
      "private"
      "public"
      "singleton"
      "type"
      "use"] @font-lock-keyword-face
     (self) @font-lock-keyword-face)))

;;;###autoload
(define-derived-mode rbs-ts-mode rbs-mode "RBS-TS"
  "Major mode for editing RBS files with Tree-sitter."
  (unless (treesit-ready-p 'rbs)
    (error "Tree-sitter grammar for RBS is not available"))
  (treesit-parser-create 'rbs)
  (setq-local treesit-font-lock-feature-list
              '((comment definition constant type variable)
                (keyword)))
  (setq-local treesit-font-lock-settings rbs-ts-mode--font-lock-settings)
  (treesit-major-mode-setup))
;;;###autoload
(add-to-list 'auto-mode-alist '("\\.rbs\\'" . rbs-ts-mode))

(provide 'rbs-ts-mode)
