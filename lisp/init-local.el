;;; set nu
(global-linum-mode t)

;;; encoding setting
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;;; tab width
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

;;; not save temp file
(setq auto-save-default nil)
(setq-default make-backup-files nil)

;;; useful plugin
;;; smartparents
(require 'smartparens-config)
(smartparens-global-strict-mode +1)

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

;;; 加载markdown
(eval-after-load "org" '(require 'ox-md nil t))

;;; org octopress
(require 'org-octopress)
(setq org-octopress-directory-top       "~/CodeRepo/GitRepo/octopress/source/org_pos/source")
(setq org-octopress-directory-posts     "~/CodeRepo/GitRepo/octopress/source/_posts")
(setq org-octopress-directory-org-top   "~/CodeRepo/GitRepo/octopress/source")
(setq org-octopress-directory-org-posts "~/CodeRepo/GitRepo/octopress/source/blog")
(setq org-octopress-setup-file          "~/CodeRepo/GitRepo/octopress/org-sty/setupfile.org")

(provide 'init-local)
