(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5036346b7b232c57f76e8fb72a9c0558174f87760113546d3a9838130f1cdb74" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" default))
 '(package-selected-packages
   '(elpher rust-mode wc-mode helpful edwina yaml-mode olivetti splash-screen ox-pandoc focus use-package rainbow-delimiters org-bullets markdown-preview-eww markdown-mode+ ivy-rich ivy-prescient horizon-theme elisp-refs doom-themes doom-modeline counsel buffer-move ample-theme))
 '(safe-local-variable-values
   '((eval add-hook 'after-save-hook
	   (lambda nil
	     (if
		 (y-or-n-p "Tangle?")
		 (org-babel-tangle)))
	   nil t)
     (eval add-hook 'after-save-hook
	   (lambda nil
	     (if
		 (y-or-n-p "Reload?")
		 (load-file user-init-file)))
	   nil t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
