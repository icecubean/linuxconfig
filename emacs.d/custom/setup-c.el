;; company-c-headers
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers)
  )

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq c-default-style) "java" ;; set style to "linux"
(defun my-indent-setup ()
  (c-set-offset 'arglist-intro '++))
(add-hook 'java-mode-hook 'my-indent-setup)

(use-package cc-mode
  :init
  (define-key c-mode-map  (kbd "C-c o") 'ff-find-other-file)
  (define-key c++-mode-map  (kbd "C-c o") 'ff-find-other-file)
  (setq transient-mark-mode t)
  (require 'cl) ; If you don't have it already
  (defun* get-closest-pathname (&optional (file "makefile"))
    "Determine the pathname of the first instance of FILE starting from the current directory towards root.
      This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
      of FILE in the current directory, suitable for creation"
    (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
      (expand-file-name file
                        (loop
                         for d = default-directory then (expand-file-name ".." d)
                         if (file-exists-p (expand-file-name file d))
                         return d
                         if (equal d root)
                         return nil))))
  (require 'compile)
  (add-hook 'c++-mode-hook (lambda () (set (make-local-variable 'compile-command) (format "export BOARD=spider2; make -C %s CC=powerpc-e500v2-linux-gnuspe-gcc CXX=powerpc-e500v2-linux-gnuspe-g++ -j9" (file-name-directory (get-closest-pathname))))))
  (add-hook 'c-mode-hook (lambda () (set (make-local-variable 'compile-command) (format "export BOARD=spider2; make -C %s CC=powerpc-e500v2-linux-gnuspe-gcc CXX=powerpc-e500v2-linux-gnuspe-g++ -j9" (file-name-directory (get-closest-pathname))))))
  (setq split-height-threshold nil)
  (setq split-width-threshold most-positive-fixnum)
  (setq compilation-scroll-output 'first-error)
  (defun my-compile ()
    "Run compile and resize the compile window"
    (interactive)
    (progn
      (call-interactively 'compile)
      (setq cur (selected-window))
      (setq w (get-buffer-window "*compilation*"))
      (select-window w)
      (setq h (window-height w))
      (shrink-window (- h 10))
      (select-window cur)
      )
    )
  (define-key c++-mode-map (kbd "<f8>") 'my-compile)
  (define-key c++-mode-map (kbd "C-<f9>") 'next-error)
  (define-key c++-mode-map (kbd "C-<f10>") 'previous-error)
  )

(server-start)

(provide 'setup-c)
