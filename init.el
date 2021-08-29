;;; init.el

;; Set gc really large, especially when loading the config file
;; These two lines prevent a stuttering cursor for some people, in most cases
;; FIXME: gc collection in idle time is not the way to do this
;(setq gc-cons-threshold 200000000)
;(run-with-idle-timer 5 t #'garbage-collect)

;; Make startup faster by reducing the frequency of garbage collection
;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 2 50 1000 1000))
;(setq gc-cons-threshold most-positive-fixnum)


;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; I don't do this:
;(setq my-org-config-file (concat user-emacs-directory "init.org"))
;(org-babel-load-file my-org-config-file)
;; Because the org config file and tangled file should follow this rule: (Taken from org-babel-load-file help)
;(let ((tangled-file (concat (file-name-sans-extension file) ".el")))

(require 'org)
(setq my-org-config-file (concat user-emacs-directory "init.org"))
(setq my-config-file (concat user-emacs-directory "org-init.el"))
;(org-babel-tangle-file my-org-config-file my-config-file "emacs-lisp\\|elisp")
(org-babel-tangle-file my-org-config-file)
(load-file my-config-file)

;;; init.el ends here
