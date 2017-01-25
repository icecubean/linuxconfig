(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-py)
(require 'setup-c)
(require 'setup-webide)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("d5b121d69e48e0f2a84c8e4580f0ba230423391a78fcb4001ccb35d02494d79e" "12b7ed9b0e990f6d41827c343467d2a6c464094cbcc6d0844df32837b50655f9" default)))
 '(ede-project-directories
   (quote
    ("/home/petbes00/Workspace/sleepyrepos/hydra/src" "/home/petbes00/Workspace/sleepyrepos/engine" "/home/petbes00/Workspace/sleepyrepos/engine/src")))
 '(global-semantic-decoration-mode t)
 '(global-semantic-idle-completions-mode t nil (semantic/idle))
 '(global-semantic-idle-summary-mode t)
 '(package-selected-packages
   (quote
    (zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company company-c-headers clean-aindent-mode anzu elpy company-jedi)))
 '(safe-local-variable-values
   (quote
    ((eval progn
           (require
            (quote projectile))
           (setq projectile-require-project-root nil)
           (setq projectile-enable-caching t)
           (setq projectile-globally-ignored-directories
                 (append
                  (quote
                   (".git" ".metadata" ".settings" "build*" "doc*" "targetdebug" "valgrind" "firmware"))
                  projectile-globally-ignored-directories))
           (setq projectile-globally-ignored-suffixies ".gitignore" ".gitattributes" ".log" ".html" "TAGS" "GTAGS" "core" ".project" ".cproject" ".img" ".bkp" ".swp")
           projectile-globally-ignored-files)
     (projectile-global-mode)
     (eval progn
           (require
            (quote projectile))
           (setq projectile-require-project-root nil)
           (setq projectile-enable-caching t)
           (setq projectile-globally-ignored-directories
                 (append
                  (quote
                   (".git" ".metadata" "build*" "doc*" "targetdebug" "valgrind" "firmware"))
                  projectile-globally-ignored-directories))
           (setq projectile-globally-ignored-files)
           projectile-globally-ignored-files)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
