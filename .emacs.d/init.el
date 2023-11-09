(custom-set-variables
 '(inhibit-startup-screen t))
(add-to-list 'default-frame-alist '(fullscreen . maximized))


(setq backup-directory-alist
      `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/auto-save-list/" t)))
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file t)

(global-display-line-numbers-mode)
;(setq display-line-numbers-type 'relative)

(keymap-global-set "C-f" 'fzf)

(set-face-attribute 'default nil :height 120)
(set-frame-font "Iosevka Comfy" nil t)
(load-theme 'dracula)

;;; require melpa
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))

					; org-mode ;

(use-package org-mode
  :hook ((org-mode . org-bullets-mode))
  :mode (("\\.org\\'" . org-mode)))


					; Python ;

(use-package python
  :hook ((python-ts-mode . eglot-ensure)
	 (python-ts-mode . company-mode))
  :bind (:map python-ts-mode-map
	      ("<f5>" . recompile)
	      ("<f6>" . eglot-format))
  :mode (("\\.py\\'" . python-ts-mode)))

(use-package highlight-indent-guides
  :ensure t
  :hook (python-ts-mode . highlight-indent-guides-mode)
  :config
  ;;(set-face-foreground 'highlight-indent-guides-character-face "white")
  (setq highlight-indent-guides-method 'character))

					; Rust ;


(use-package rust-ts-mode
  :ensure t
  :hook ((rust-ts-mode . eglot-ensure)
	 (rust-ts-mode . company-mode))
  :bind (:map rust-ts-mode-map
	      ("<f5>" . recompile)
	      ("<f6>" . eglot-format))
  :mode (("\\.rs\\'" . rust-ts-mode))
  :config
  (add-to-list 'exec-path "/home/nikos/.cargo/bin")
  (setenv "PATH" (concat (getenv "PATH") ":/home/nikos/.cargo/bin")))

; 
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1))
