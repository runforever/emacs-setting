;;; set nu
(global-linum-mode t)

;;; flycheck
(require 'flycheck)

;;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;;; tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;;; encoding setting
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;;; font settings
(set-frame-font "Inconsolata-19")

;;; not save temp file
(setq auto-save-default nil)
(setq-default make-backup-files nil)

;;; useful plugin
;;; smartparents
(require 'smartparens-config)
(smartparens-global-mode +1)

;;; window-numbering
(window-numbering-mode t)
(setq window-numbering-assign-func
            (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

;;; zen coding
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)

;;; org mode
;;; 打开后缀名为org的文件时自动启用org mode
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-font-lock-mode 1)
(setq org-export-with-sub-superscripts nil)

;;; 加载markdown
(eval-after-load "org" '(require 'ox-md nil t))

;;; org octopress
(require 'org-octopress)
(setq org-octopress-directory-top       "~/CodeRepo/GitRepo/Road/blog/source")
(setq org-octopress-directory-posts     "~/CodeRepo/GitRepo/Road/blog/source/_posts")
(setq org-octopress-directory-org-top   "~/CodeRepo/GitRepo/Road/blog/source")
(setq org-octopress-directory-org-posts "~/CodeRepo/GitRepo/Road/blog/org/source")
(setq org-octopress-setup-file          "~/CodeRepo/GitRepo/Road/blog/org/setupfile.org")

;;; go mode
(require 'go-mode-load)

;;; go format
(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq indent-tabs-mode nil)))

;;; paredit in clojure mode
(after-load 'clojure-mode
  (add-hook 'clojure-mode-hook 'paredit-everywhere-mode))

;;; python
(require 'compile)
(require 'python-pep8)
(require 'python)
(require 'flycheck-pyflakes)

(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "--pylab"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))

; (add-hook 'python-mode-hook #'(lambda () (setq flycheck-checker 'flycheck-pyflakes)))

;;; remove tailwhitespace
(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))

;;; indent
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq tab-stop-list ())

;;; web auto indent
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

;(setq web-mode-markup-indent-offset 4)
;(setq web-mode-css-indent-offset 4)
;(setq web-mode-code-indent-offset 4)

(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

(setq flycheck-disabled-checkers '(html-tidy))

;;; ox-rsg
(require 'ox-rst)

;;; elixir
(require 'flycheck-elixir)

(unless (package-installed-p 'alchemist)
  (package-install 'alchemist))
(add-to-list 'package-pinned-packages '(alchemist . "melpa-stable") t)

(setq alchemist-mix-command "/usr/local/bin/mix")
(setq alchemist-execute-command "/usr/local/bin/elixir")
(setq alchemist-compile-command "/usr/local/bin/elixirc")

;;; restful client
(require 'restclient)

;;; multi term
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(setq system-uses-terminfo nil)

;;; company mode
; (add-hook 'after-init-hook 'global-company-mode)

(provide 'init-local)
