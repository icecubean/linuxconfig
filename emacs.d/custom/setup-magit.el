(use-package magit
  :config
  (progn
    (setq magit-diff-options '("-b")) ; ignore whitespace
    :bind (("C-x v d" . magit-status))))


(provide 'setup-magit)
