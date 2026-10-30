;;; -*- lexical-binding: t; -*-
;; code
(global-display-line-numbers-mode 1)

;; Remove welcome message
(setq inhibit-startup-message t)

;; Remove menus
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq ring-bell-function 'ignore)

;;Theme
(load-theme 'dracula t)


;;MELPA packages
(require 'package)
(add-to-list  'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/")t)
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; Emacs configs.
(package-initialize)

;; Load functions
(add-to-list 'load-path "/home/matheus/.emacs.d/lisp/")
(add-to-list 'load-path "/home/matheus/.elan/lean4-mode")

(require 'lean4-mode)
;;(require 'my-cpp-compile-quantum)
(require 'func)

;;(my-cpp-compile-quantum)
(my-cpp-compile)
(my-c-compile)
;;Org-Roam
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/Documents/org-roam/");; ajuste para a pasta onde você quer guardar suas notas
  (setq org-roam-directories
      '("~/Documents/org-roam/areas/quantum_computing"
        "~/Documents/org-roam/areas/quantum_network"))
  (setq org-roam-db-location "~/Documents/org-roam/org-roam.db")
  ;; Load custom org-roam templates
  (setq org-roam-capture-templates
      '(
        ("a" "Academic Article" plain
         (file "~/.emacs.d/templates/PaperTemplate.org") ; Path to your template file
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+roam_tags: article\n\n")
         :immediate-finish t ; Automatically create the file, then open for editing
         :unnarrowed t)
        ))
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point))
  :config
  (org-roam-setup))


;;rust
;;(use-package rust-mode
;;  :ensure t
;;  :mode "\\.rs\\'"
;;  :config
;;  (setq rust-format-on-save t))


(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))


;; Elfeed
(setq elfeed-feeds
      '("https://rss.arxiv.org/rss/hep-ph"
	"https://rss.arxiv.org/rss/quant-ph"
	"http://wp.quantum-journal.org/feed/"
        ))


(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(customize-set-variable 'tramp-use-ssh-controlmaster-options nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(cargo company dracula-theme elfeed flycheck julia-mode lsp-mode
	   magit org-roam robe tramp yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
