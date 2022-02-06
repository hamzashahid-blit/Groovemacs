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
(add-to-list 'load-path (concat user-emacs-directory "custom"))
(load-file my-config-file)

;;; init.el ends here



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indent-guides-method 'character)
 '(org-superstar-leading-bullet " ")
 '(package-selected-packages
    '(multi-term vterm-extra wgrep flyspell-popup corfu embark-consult embark marginalia consult orderless vertico smart-tabs-mode sly direnv multi-vterm org-bullets yasnippet-snippets yafolding which-key web-mode vterm visual-regexp-steroids use-package undo-tree try treemacs sublimity smooth-scrolling restart-emacs ranger rainbow-delimiters quelpa projectile pdf-tools org-superstar org-download olivetti nswbuff nix-mode magit lua-mode js2-mode j-mode hindent highlight-indent-guides helpful haskell-mode good-scroll gnu-apl-mode general fold-this evil-surround evil-smartparens evil-paredit evil-org evil-nerd-commenter evil-multiedit evil-mc evil-matchit evil-lion evil-goggles evil-exchange evil-collection eterm-256color emmet-mode eimp doom-themes doom-modeline command-log-mode cmake-mode cl-libify centaur-tabs auto-dictionary auctex-latexmk anzu all-the-icons-dired))
 '(vr/engine 'pcre2el))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-ex-lazy-highlight ((t (:inherit lazy-highlight))))
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed))))
 '(highlight ((t (:background "#555555" :foreground "#f2e5c6"))))
 '(org-superstar-leading ((t (:inherit default)))))
(put 'dired-find-alternate-file 'disabled nil)
