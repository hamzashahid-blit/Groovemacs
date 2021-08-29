;;; init.el --- Hamza Shahid's Emacs Config
;;; Code:









;; Make life easier














;;;;;;;;;;;;;;;;;
;;; EVIL MODE ;;;
;;;;;;;;;;;;;;;;;




;;; PROGRAMMING ;;;




;;; DEVELOPMENT START ;;;

;; LSP



;; Haskell START ;;




;; Haskell END ;;







;; C++ START ;;


;;; DOESN'T WORK AUTOMATICALLY or does it?




;; C++ END ;;


;; Web Development ;;


;; Web Development ;;

;;; Programming End ;;;



;;; Image Related Stuff Start ;;;

;;; Image Related Stuff End ;;;



;;; Org Mode Start ;;;



;;; DIRED start ;;;



;;; DIRED end ;;

;; Babel Start



;; Babel End

;;; Org Mode End ;;;




;;; Custom Functions Start ;;;



;;; Custom Functions End ;;;



;;; Keybindings





;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(helm-minibuffer-history-key "M-p")
;;  '(package-selected-packages
;;    '(restart-emacs epc deferred ctable eaf quelpa org-superstar nlinum-relative pdf-tools auctex-latexmk latexmk org-download org-roam org-noter olivetti yasnippet-snippets which-key use-package undo-tree try sublimity smooth-scrolling ranger rainbow-delimiters projectile org-bullets magit lua-mode ivy-rich iedit hydra helpful helm-dash haskell-mode google-c-style general flymake-google-cpplint flymake-cursor evil-collection eimp doom-themes doom-modeline counsel command-log-mode auto-complete-c-headers auctex))
;;  '(safe-local-variable-values
;;    '((eval compile "latexmk -pdf -pvc -pdflatex='pdflatex -shell-escape -interaction nonstopmode'")
;; 	 (eval add-hook 'after-save-hook 'org-latex-export-to-latex nil t)
;; 	 (eval server-start))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(org-superstar-leading ((t (:foreground "#282828")))))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(all-the-icons-dired-monochrome nil)
 '(ansi-color-names-vector
    ["#282828" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#cc241d" "#8ec07c" "#ebdbb2"])
 '(custom-safe-themes
    '("08a27c4cde8fcbb2869d71fdc9fa47ab7e4d31c27d40d59bf05729c4640ce834" "aaa4c36ce00e572784d424554dcc9641c82d1155370770e231e10c649b59a074" "4a8d4375d90a7051115db94ed40e9abb2c0766e80e228ecad60e06b3b397acab" "d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" default))
 '(fci-rule-color "#7c6f64")
 '(flymake-google-cpplint-command "cpplint")
 '(helm-minibuffer-history-key "M-p")
 '(highlight-indent-guides-auto-character-face-perc 20)
 '(highlight-indent-guides-method 'character)
 '(ivy-initial-inputs-alist
    '((counsel-minor . "")
       (counsel-package . "")
       (counsel-org-capture . "")
       (counsel-M-x . "")
       (counsel-describe-symbol . "")
       (org-refile . "")
       (org-agenda-refile . "")
       (org-capture-refile . "")
       (Man-completion-table . "")
       (woman . "")))
 '(jdee-db-active-breakpoint-face-colors (cons "#0d1011" "#fabd2f"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d1011" "#b8bb26"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d1011" "#928374"))
 '(objed-cursor-color "#fb4934")
 '(org-babel-latex-htlatex "htlatex")
 '(org-babel-load-languages
    '((shell . t)
       (latex . t)
       (C . t)
       (java . t)
       (python . t)
       (awk . t)))
 '(org-confirm-babel-evaluate nil)
 '(org-emphasis-alist
    '(("*" bold)
       ("/" italic)
       ("_" underline)
       ("+" org-verbatim verbatim)
       ("=" org-code verbatim)
       ("~"
         (:strike-through t))
       '(org-latex-default-packages-alist
          '(("AUTO" "inputenc" t
              ("pdflatex"))
             ("T1" "fontenc" t
               ("pdflatex"))
             ("" "graphicx" t nil)
             ("" "grffile" t nil)
             ("" "longtable" nil nil)
             ("" "wrapfig" nil nil)
             ("" "rotating" nil nil)
             ("normalem" "ulem" t nil)
             ("" "amsmath" t nil)
             ("" "textcomp" t nil)
             ("" "amssymb" t nil)
             ("" "capt-of" nil nil)
             ("" "hyperref" nil nil)))
       '(org-support-shift-select 'always)
       '(package-selected-packages
          '(exwm-randr evil-smartparens smartparens yasnippet-snippets which-key use-package undo-tree try sublimity smooth-scrolling restart-emacs ranger rainbow-delimiters quelpa projectile pdf-tools org-superstar org-roam org-noter org-download org-bullets olivetti nlinum-relative magit lua-mode ivy-rich iedit hydra helpful helm-dash haskell-mode google-c-style general flymake-google-cpplint flymake-cursor evil-collection epc eimp eaf doom-themes doom-modeline counsel command-log-mode auto-complete-c-headers auctex-latexmk))
       '(pdf-view-midnight-colors
          (cons "#ebdbb2" "#282828"))
       '(rustic-ansi-faces
          ["#282828" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#cc241d" "#8ec07c" "#ebdbb2"])
       '(vc-annotate-background "#282828")
       '(vc-annotate-color-map
          (list
            (cons 20 "#b8bb26")
            (cons 40 "#cebb29")
            (cons 60 "#e3bc2c")
            (cons 80 "#fabd2f")
            (cons 100 "#fba827")
            (cons 120 "#fc9420")
            (cons 140 "#fe8019")
            (cons 160 "#ed611a")
            (cons 180 "#dc421b")
            (cons 200 "#cc241d")
            (cons 220 "#db3024")
            (cons 240 "#eb3c2c")
            (cons 260 "#fb4934")
            (cons 280 "#e05744")
            (cons 300 "#c66554")
            (cons 320 "#ac7464")
            (cons 340 "#7c6f64")
            (cons 360 "#7c6f64")))
       '(vc-annotate-very-old-color nil)))
 '(package-selected-packages
    '(tex auto-dictionary centaur-tabs company-auctex j-mode evil-paredit paredit slime boon xah-fly-keys pcre2el which-key which-key-posframe js2-mode web-mode emmet-mode cmake-mode evil-mu4e vterm fold-this yafolding ivy-posframe evil-owl evil-org evil-matchit evil-nerd-commenter evil-goggles evil-exchange evil-lion good-scroll anzu evil-multiedit evil-mc multiple-cursors visual-regexp-steroids eterm-256color treemacs-icons-dired all-the-icons-dired dired-icons evil-surround org-drill ivy-prescient smart-tabs-mode highlight-indent-guides flx-counsel flx hindent dap-haskell dap-mode lsp-treemacs lsp-ivy lsp-ui lsp-haskell yasnippet-snippets use-package undo-tree try sublimity smooth-scrolling restart-emacs ranger rainbow-delimiters quelpa projectile pdf-tools org-superstar org-roam org-noter org-download olivetti magit lua-mode ivy-rich iedit hydra helpful helm-dash haskell-mode general evil-smartparens evil-collection eimp doom-themes doom-modeline counsel concurrent command-log-mode cl-libify auto-complete auctex-latexmk))
 '(tab-stop-list '(4))
 '(whitespace-style '(face trailing) t))

(put 'narrow-to-region 'disabled nil)


;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(helm-minibuffer-history-key "M-p")
;;  '(package-selected-packages
;;    '(iflipb cl-libify yasnippet-snippets which-key use-package undo-tree try sublimity smooth-scrolling restart-emacs ranger rainbow-delimiters quelpa projectile pdf-tools org-superstar org-roam org-noter org-download olivetti magit lua-mode ivy-rich iedit hydra helpful helm-dash haskell-mode general evil-smartparens evil-collection eimp doom-themes doom-modeline counsel command-log-mode auctex-latexmk)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#282828" :foreground "#ebdbb2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "PfEd" :family "Mononoki"))))
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed))))
 '(gnu-apl-default ((t (:weight semi-bold :family "FreeMono"))) t)
 '(mode-line ((t (:background "#504945" :foreground "#dfd2b8" :box nil :width normal :family "Mononoki"))))
 '(org-ellipsis ((t (:foreground "#504945" :underline nil))))
 '(org-superstar-leading ((t (:inherit default :foreground "#282828"))))
 '(whitespace-tab ((t (:foreground "#636363")))))

 ;; Replaced by highlight-indent-guides
 ;; (setq whitespace-display-mappings
 ;;  '((tab-mark 9 [124 9] [92 9]))) ; 92 and 124 is the ascii ID for '\|'

;; (provide 'init)

;; ;;; init.el ends here
