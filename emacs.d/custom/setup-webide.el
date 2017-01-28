(use-package js2-mode
  :ensure t
  :defer t
  )

(use-package web-mode
  :ensure t
  :defer t)

(use-package jade-mode
  :ensure t
  :defer t)


(defcustom preferred-javascript-mode
  (first (remove-if-not #'fboundp '(js2-mode js-mode)))
  "Javascript mode to use for .js files."
  :type 'symbol
  :group 'programming
  :options '(js2-mode js-mode))

(defconst preferred-javascript-indent-level 2)

;; Need to first remove from list if present, since elpa adds entries too, which
;; may be in an arbitrary order
(eval-when-compile (require 'cl))
(setq auto-mode-alist (cons `("\\.\\(js\\|es6\\)\\(\\.erb\\)?\\'" . ,preferred-javascript-mode)
                            (loop for entry in auto-mode-alist
                                  unless (eq preferred-javascript-mode (cdr entry))
                                  collect entry)))


;; js2-mode

;; Change some defaults: customize them to override
(setq-default js2-basic-offset 2
              js2-bounce-indent-p nil)

;; js-mode
(setq-default js-indent-level preferred-javascript-indent-level)
(add-to-list 'interpreter-mode-alist (cons "node" preferred-javascript-mode))

;; Javascript nests {} and () a lot, so I find this helpful

(when (and (executable-find "ag")
           (maybe-require-package 'xref-js2))
  (after-load 'js2-mode
    (define-key js2-mode-map (kbd "M-.") nil)
    (add-hook 'js2-mode-hook
              (lambda () (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))))



(provide 'setup-webide)
