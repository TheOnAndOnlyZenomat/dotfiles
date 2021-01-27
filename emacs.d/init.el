(setq user-full-name "Adrian Eichelbaum"
      user-mail-address "ad.eichelbaum@gmail.com")

(setq initial-scratch-message ";; Welcome back, Zeno")

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar
(setq truncate-partial-width-windows nil)
(set-default 'truncate-lines t)

(setq-default cursor-type 'bar)

(global-hl-line-mode)                ; Highlight current line
(global-display-line-numbers-mode t) ; Show line numbers

(dolist (mode '(shell-mode-hook))
(add-hook mode (lambda() (display-line-numbers-mode 0))))

(set-face-attribute 'default nil :font "Tamzen 12")
(load-theme 'doom-horizon t)

(add-to-list 'load-path "~/.emacs.d/custom")

;; write custom configs to seperate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Keep all backup and auto-save files in one directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(delete-selection-mode t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(substitute-key-definition 'kill-buffer 'kill-buffer-and-window global-map)

(setq split-height-threshold nil)
(setq split-width-threshold 0)

(setq org-publish-project-alist
      '(("zenopage" ;; my blog project (just a name)
         ;; Path to org files.
         :base-directory "~/code/zenopage/_drafts/"
         :base-extension "org"
         ;; Path to Jekyll Posts
         :publishing-directory "~/code/zenopage/_posts/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :html-extension "html"
         :body-only t
         )))

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(require 'splash-screen)

(setq calendar-location-name "Leizpig, DE") 
(setq calendar-latitude 51.33)
(setq calendar-longitude 12.37)

(require 'theme-changer)
(change-theme 'doom-horizon 'doom-horizon)

(use-package buffer-move
  :bind (
    ("<C-S-up>" . buf-move-up)
    ("<C-S-down>" . buf-move-down)
    ("<C-S-left>" . buf-move-left)
    ("<C-S-right>" . 'buf-move-right)
    )
  )

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package org
  :mode (("\\.org$" . org-mode))
  :bind(
    ("C-c l" . 'org-store-link)
    ("C-c a" . 'org-agenda)
    ("C-c c" . 'org-capture)
    )
  )

(use-package org-bullets
  )
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package ox-pandoc
  :defer 10)

(use-package ivy
  :diminish
  :bind  (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  )
(ivy-mode 1)

(use-package counsel
  :bind  (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package olivetti)

(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/custom/edwina"))

(use-package edwina
  :config
  (setq display-buffer-base-action '(display-buffer-below-selected))
  (edwina-setup-dwm-keys)
  (edwina-mode 1))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))
