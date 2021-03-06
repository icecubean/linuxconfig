(menu-bar-mode nil)
(tool-bar-mode -1)
(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)



(defalias 'yes-or-no-p 'y-or-n-p)

;; use space to indent by default
(setq-default indent-tabs-mode t)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

(setq default-directory "/home/petbes00/Workspace/sleepyrepos/" )
;; Compilation


(global-set-key (kbd "<f8>") (lambda ()
                               (interactive)
                               (call-interactively 'compile)))
(global-set-key (kbd "<f7>") 'speedbar)

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; company
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends))

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

                                        ; automatically indent when press RET
(use-package tramp
  :ensure t
  :init
  (require 'tramp)
  (setq tramp-default-method "ssh")
  )

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)
(provide 'setup-general)
