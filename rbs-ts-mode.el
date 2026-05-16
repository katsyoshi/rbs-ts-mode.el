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
   '((comment) @font-lock-comment-face)))

;;;###autoload
(define-derived-mode rbs-ts-mode rbs-mode "RBS"
  "Major mode for editing RBS files with Tree-sitter."
  (unless (treesit-ready-p 'rbs)
    (error "Tree-sitter grammar for RBS is not available"))
  (treesit-parser-create 'rbs)
  (setq-local treesit-font-lock-feature-list '(comment))
  (setq-local treesit-font-lock-settings rbs-ts-mode--font-lock-settings)
  (treesit-major-mode-setup))
;;;###autoload
(add-to-list 'auto-mode-alist '("\\.rbs\\'" . rbs-ts-mode))

(provide 'rbs-ts-mode)

