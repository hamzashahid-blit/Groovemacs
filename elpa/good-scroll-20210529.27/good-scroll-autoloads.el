;;; good-scroll-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "good-scroll" "good-scroll.el" (0 0 0 0))
;;; Generated autoloads from good-scroll.el

(defvar good-scroll-mode nil "\
Non-nil if Good-Scroll mode is enabled.
See the `good-scroll-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `good-scroll-mode'.")

(custom-autoload 'good-scroll-mode "good-scroll" nil)

(autoload 'good-scroll-mode "good-scroll" "\
Good pixel line scrolling

If called interactively, enable Good-Scroll mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "good-scroll" '("good-scroll-")))

;;;***

;;;### (autoloads nil "good-scroll-bezier" "good-scroll-bezier.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from good-scroll-bezier.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "good-scroll-bezier" '("good-scroll-bezier")))

;;;***

;;;### (autoloads nil "good-scroll-linear" "good-scroll-linear.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from good-scroll-linear.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "good-scroll-linear" '("good-scroll-linear")))

;;;***

;;;### (autoloads nil nil ("good-scroll-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; good-scroll-autoloads.el ends here
