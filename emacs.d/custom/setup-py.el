;; company-c-headers
(use-package company-jedi
  :ensure t
  :defer t
  :init
  (add-to-list 'company-backends 'company-jedi))

(use-package pyvenv)

(use-package auto-complete)

; from python.el
(use-package python
  :ensure t
  :defer t
  :init
  (require 'auto-complete-config)
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args "--simple-prompt -i"
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
  (setq ac-sources '(ac-source-pycomplete
                                ac-source-yasnippet
                                ac-source-abbrev
                                ac-source-dictionary
                                ac-source-words-in-same-mode-buffers))
  (ac-set-trigger-key "TAB")
  (ac-set-trigger-key "<tab>")
  (setq ac-auto-start 2)
  (setq ac-ignore-case nil)
  )


(provide 'setup-py)
