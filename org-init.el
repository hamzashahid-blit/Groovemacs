(setq-default
 inhibit-startup-message t    ; Will not show up Emacs logo and splash on screen
 visible-bell t               ; Will flash the screen on error/invalid operation
 fill-column 100              ; toggle wrapping text at the 80th character
 tab-width 4                  ; Set width for tabs
 delete-by-moving-to-trash t  ; Delete files to trash
 backup-directory-alist `(("." . "~/.saves")) ;; Save tmp file saves to ~/.saves
 ;; print a default message in the empty scratch buffer opened at startup
 initial-scratch-message ";; Welcome to Groovemacs!\n\n")

;; Icons in doom modeline are turned off by design when run from daemon
(setq doom-modeline-icon t)
	  ;doom-modeline-height 27)

(tool-bar-mode -1)              ; Remove toolbar on top
(menu-bar-mode -1)              ; Remove menubar below toolbar
(tooltip-mode -1)               ; Remove tooltip (help on hover)
(scroll-bar-mode -1)            ; Remove scrollbar
(set-fringe-mode 10)            ; Give some breathing room
(fset 'yes-or-no-p 'y-or-n-p)   ; Replace yes/no prompts with y/n
(global-subword-mode 1)         ; Iterate through CamelCase words
(setf frame-resize-pixelwise t) ; Remove annoying border in StumpWM & KDE

;; Make ESC quit prompts
;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Garbage-collect on focus-out, Emacs should feel snappier overall.
;; but messes with (use-package smooth-scrolling)
(add-function :after after-focus-change-function
(defun me/garbage-collect-maybe ()
	(unless (frame-focus-state)
	(garbage-collect))))

;; TODO: Which-key gets covered up with minibuffer if font size is 13 or above

;; (defun my-frame-tweaks (&optional frame)
;;   "My personal frame tweaks."
;;   (interactive)
;;   (unless frame
;; 	(setq frame (selected-frame)))
;;   (when frame
;; 	(with-selected-frame frame
;; 	(when (display-graphic-p)
;;   (set-face-attribute 'default nil :font "Mononoki" :height 120)
;;   (let ((faces '(mode-line
;; 		  mode-line-buffer-id
;; 		  mode-line-emphasis
;; 		  mode-line-highlight
;; 		  mode-line-inactive)))
;; 	  (mapc
;; 	  (lambda (face) (set-face-attribute face nil
;; 						:font "Mononoki-12")) faces))))))

;; Default font size
;(set-face-attribute 'default nil :font "Mononoki" :height 125) ;; :height 118

;(my-frame-tweaks)
;(add-hook 'after-make-frame-functions #'my-frame-tweaks t)

(add-hook 'server-after-make-frame-hook
		  (lambda ()
			(interactive)
			(set-frame-parameter (selected-frame) 'alpha-background 0.9)))

(add-to-list 'default-frame-alist '(font . "Mononoki-13"))
(set-face-attribute 'default t :font "Mononoki-13")

;;; Default to utf-8 encoding
(set-default-coding-systems 'utf-8)
(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; (let ((faces '(mode-line
;; 			  mode-line-buffer-id
;; 			  mode-line-emphasis
;; 			  mode-line-highlight
;; 			  mode-line-inactive)))
;; 	(mapc
;; 	 (lambda (face) (set-face-attribute face nil :font "Monospace-10"))
;; 	 faces))

;;(add-to-list 'load-path "~/.emacs.d/")

    ;; Bring in to the environment all package management functions
    (require 'package)

    ;; A list of package repositories
    (setq package-archives '(("melpa" . "https://melpa.org/packages/")
						     ("org"   . "https://orgmode.org/elpa/")
						     ("elpa"  . "https://elpa.gnu.org/packages/")))
    ;; Initializes the package system and prepares it to be used
    (package-initialize)

    (unless package-archive-contents  ; Unless a package archive already exists,
      (package-refresh-contents))     ; Refresh package contents so that Emacs knows which packages to load

    ;; Initialize use-package on non-linux platforms
    (unless (package-installed-p 'use-package)  ; Unless "use-package" is installed, install "use-package"
      (package-install 'use-package))

    (require 'use-package) ; Once it's installed, we load it using require

    ;; Make sure packages are downloaded and installed before they are run
    ;; also frees you from having to put :ensure t after installing EVERY PACKAGE.
    (setq use-package-always-ensure t)

;; Use cl-libify to remove cl errors
    ;(use-package cl-libify
    ;  :config
    ;  (require 'cl-lib))

;; Emacs X Window Manager (EXWM)
;; (use-package exwm
;;   :defer t
;;   ;; :config
;;   ;; (require 'exwm-config)
;;   ;; (exwm-config-default)
;;   ;; (require 'exwm-randr)
;;   ;; (setq exwm-randr-workspace-output-plist '(0 "LVDS1"))
;;   ;; (add-hook 'exwm-randr-screen-change-hook
;;   ;;               (lambda ()
;;   ;;               (start-process-shell-command
;;   ;;                 "xrandr" nil "xrandr --output LVDS1 --mode 1366x768 --pos 0x0 --rotate normal")))
;;   ;;  (exwm-randr-enable)
;;   ;;  (require 'exwm-systemtray)
;;   ;; (exwm-systemtray-enable)
;; )

;; Keeps the point away from the top and bottom and keep lines of
;; context around the point visible as much as possible
;; (use-package smooth-scrolling
;;   :config
;;   (smooth-scrolling-mode 1))

(setq scroll-conservatively 111         ;; move minimum when cursor exits view, instead of recentering
	  mouse-wheel-scroll-amount '(1)    ;; mouse scroll moves 1 line at a time, instead of 5 lines
	  mouse-wheel-progressive-speed nil ;; don't accelerate scrolling
	  mouse-wheel-follow-mouse 't       ;; scroll window under mouse
	  scroll-step 1)                    ;; keyboard scroll one line at a time

;; (use-package sublimity
;;   :init
;;   (require 'sublimity-scroll)
;;   :config
;;   (sublimity-mode 1))

;; (pixel-scroll-mode t)
;; (setq pixel-resolution-fine-flag t)
;; (setq mouse-wheel-scroll-amount '(1))
;; (setq fast-but-imprecise-scrolling t)
;; (setq jit-lock-defer-time 0)
;; (setq mouse-wheel-progressive-speed nil)

;; (use-package good-scroll)

;; Keep cursor in center

;; (setq scroll-preserve-screen-position t
;;       scroll-conservatively 0
;;       maximum-scroll-margin 0.5
;;       scroll-margin 99999)

(use-package hl-line
  :config
  (global-hl-line-mode 1))
; (set-face-attribute 'hl-line nil :background "gray21"))

(use-package restart-emacs
  :defer t)

;; Allows you to "try" a package without installing it
(use-package try
  :defer t)

;; Power of Emacs' powerful undo system more intuitivily. Inspired by VIM
(use-package undo-tree
  :config
  (global-undo-tree-mode))

(use-package command-log-mode        ; See which commands are run and the output of them in a side window
  :defer t
  :diminish                          ; Removes command-log showing up in modeline
  :config
  (global-command-log-mode))

(use-package pcre2el
  :config
  (pcre-mode 0))

;; Jump around very conveniently
(use-package avy)

;; Search with regexp and others
(use-package anzu
  :defer t)

(use-package ranger
  :defer t)

(use-package no-littering)

;; Create a variable for our preferred tab width
(setq custom-tab-width 4)
(setq custom-tab-width2 2)

;; Two callable functions for enabling/disabling tabs in Emacs
(defun hamza/disable-tabs ()
  (interactive)
  (setq indent-tabs-mode nil))

(defun hamza/enable-tabs  ()
  (interactive)
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))

;; Hooks to Enable Tabs
(add-hook 'prog-mode-hook 'hamza/enable-tabs)
;; Hooks to Disable Tabs
(add-hook 'lisp-mode-hook 'hamza/disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'hamza/disable-tabs)

;; Language-Specific Tweaks
(setq-default c-basic-offset custom-tab-width)
(setq-default python-indent-offset custom-tab-width) ;; Python
(setq-default js-indent-level custom-tab-width)      ;; Javascript
(setq-default lisp-indent-offset custom-tab-width2)  ;; Lisp

;; Indenting Behaviour
(put 'add-function 'lisp-indent-function 2)
(put 'advice-add 'lisp-indent-function 2)
(put 'evil-define-key* 'lisp-indent-function 'defun)
(put 'plist-put 'lisp-indent-function 2)

;; Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)

;; Make the backspace properly erase the tab instead of
;; removing 1 space at a time.
(setq backward-delete-char-untabify-method 'hungry)

;; (OPTIONAL) Shift width for evil-mode users
;; For the vim-like motions of ">>" and "<<".
(setq-default evil-shift-width custom-tab-width)

;; draws visual tabs on screen lines or bitmap (customize-variable (highlight-indent-guides-method))
(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode))

;; Turn on whitespace-mode (color extra spaces red) only for listed modes
(dolist (mode '(text-mode-hook
				fundamental-mode-hook
				org-mode-hook))
  (add-hook mode (lambda () (whitespace-mode t))))

(setq whitespace-style '(face trailing))

;; for tabs AND spaces at the same time
(use-package smart-tabs-mode
  :config
  (setq evil-indent-convert-tabs nil))

;;(setq-default indent-tabs-mode nil)

(use-package doom-themes
  :init (load-theme 'doom-gruvbox t))

(use-package centaur-tabs
    :bind (:map evil-normal-state-map
	    ("g t" . centaur-tabs-forward)
	    ("g T" . centaur-tabs-backward))
    :config
    (setq centaur-tabs-style 'box
	  centaur-tabs-set-bar 'over        ;; Set a bar 'over 'under 'left ... of the tab denoting which tab we are on
	  x-underline-at-descent-line t      ;; If not using spacemacs this will display bar correctly
	  centaur-tabs-set-icons t           ;; show icons in tabs
	  centaur-gray-out-icons nil         ;; if set to 'buffer gray out icons of any buffer tab like *scrath* or dired
	  centaur-tabs-height 24             ;; set tab height
	  centaur-tabs-set-modified-marker t ;; we want to change the "x" icon on the tab when buffer is unsaved
	  centaur-tabs-modified-marker "???")  ;; set the marker for above change
:after
    (centaur-tabs-mode t))

;; (use-package helm
;;   :diminish           ;Removes Helm showing up in modeline
;;   :init
;; 	(require 'helm-config)                       ; Load helm's config
;; 	(setq helm-move-to-line-cycle-in-source t    ; Cycle to the top when you go past the bottom and vice versa;
;; 		  helm-split-window-in-side-p t)
;;   :config
;; 	;(helm-mode 1) ;; Most of Emacs prompts become helm-enabled
;; 	(helm-autoresize-mode 1) ;; Helm resizes according to the number of candidates
;; 	;(global-set-key (kbd "C-x b") 'helm-buffers-list) ;; List buffers ( Emacs way )
;; 	;(define-key evil-ex-map "b" 'helm-buffers-list) ;; List buffers ( Vim way )
;; 	(global-set-key (kbd "C-x r b") 'helm-bookmarks) ;; Bookmarks menu
;; 	(global-set-key (kbd "C-x C-f") 'helm-find-files) ;; Finding files with Helm
;; 	(global-set-key (kbd "M-c") 'helm-calcul-expression) ;; Use Helm for calculations
;; 	(global-set-key (kbd "C-s") 'helm-occur) ;; Replaces the default isearch keybinding
;; 	(global-set-key (kbd "C-h a") 'helm-apropos)  ;; Helmized apropos interface
;; 	(global-set-key (kbd "M-X") 'helm-M-x)  ;; Improved M-x menu
;; 	(global-set-key (kbd "M-y") 'helm-show-kill-ring))  ;; Show kill ring, pick something to paste

;; (use-package dash)
;; (use-package helm-dash)

;; (use-package ivy
;;   :diminish
;;   :bind (("C-s" . swiper)
;; 	 :map ivy-minibuffer-map
;; 	 ("TAB" . ivy-alt-done)
;; 	 ("C-l" . ivy-alt-done)
;; 	 ("C-j" . ivy-next-line)
;; 	 ("C-k" . ivy-previous-line)
;; 	 :map ivy-switch-buffer-map
;; 	 ("C-k" . ivy-previous-line)
;; 	 ("C-l" . ivy-done)
;; 	 ("C-d" . ivy-switch-buffer-kill)
;; 	 :map ivy-reverse-i-search-map
;; 	 ("C-k" . ivy-previous-line)
;; 	 ("C-d" . ivy-reverse-i-search-kill))
;;   :config
;;   (ivy-mode 1)
;;  '(ivy-initial-inputs-alist nil)
;;   (setq ivy-re-builders-alist
;; 	  '((ivy-switch-buffer . ivy--regex-plus)
;; 		(swiper . ivy--regex-plus)
;; 		(t . ivy--regex-plus)))) ;; you could use ivy--regex-fuzzy for ULTIMATE Matching
;; 								 ;; but it is too much for me

;; ;; Sorts latest commands (faster than smex) to the top
;; (use-package ivy-prescient
;; 	:config
;; 	(ivy-prescient-mode 1))

;; ;; Fuzzy Sort Ivy
;; (use-package flx)

;; ;; Shows description and keybinding of function
;; ;; also colors modes that are on and other tweaks
;; (use-package ivy-rich
;; 	:init
;; 	(ivy-rich-mode 1))

;; ;; Persist history over Emacs restarts
;; (use-package savehist
;;   :init
;;   (savehist-mode))

;; ;; Pop up windows for evil-owl and the such
;; (use-package ivy-posframe)

;; (use-package counsel
;;   :bind (("M-x" . counsel-M-x)))

(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-cycle t)
  (setq vertico-resize nil)
  :bind (:map vertico-map
		  ("C-j" . vertico-next)
		  ("C-k" . vertico-previous)
		  ("C-d" . vertico-scroll-down)
		  ("C-u" . vertico-scroll-up) ())
  :config
  (setq completion-styles '(substring orderless)
		read-file-name-completion-ignore-case t ;; Ignore Case w/ files
		read-buffer-completion-ignore-case t))  ;; Ignore Case w/ buffers


;; Components starting with ! indicate the rest of the component must not occur in the candidate
(defun hamza/orderless-without-if-bang (pattern _index _total)
  (cond
   ((equal "!" pattern)
	'(orderless-literal . ""))
   ((string-prefix-p "!" pattern)
	`(orderless-without-literal . ,(substring pattern 1)))))

(use-package orderless
  :init
  (setq completion-styles '(substring orderless)
		completion-category-defaults nil
		completion-category-overrides '((file (styles partial-completion)))
		orderless-matching-styles '(orderless-flex orderless-literal orderless-regexp)
		orderless-style-dispatchers '(hamza/orderless-without-if-bang)))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
	(cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
	'(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Example configuration for Consult
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings (mode-specific-map)
		 ("C-c h" . consult-history)
		 ("C-c m" . consult-mode-command)
		 ("C-c b" . consult-bookmark)
		 ("C-c k" . consult-kmacro)
		 ;; C-x bindings (ctl-x-map)
		 ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
		 ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
		 ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
		 ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
		 ;; Custom M-# bindings for fast register access
		 ("M-#" . consult-register-load)
		 ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
		 ("C-M-#" . consult-register)
		 ;; Other custom bindings
		 ("M-y" . consult-yank-pop)                ;; orig. yank-pop
		 ("<help> a" . consult-apropos)            ;; orig. apropos-command
		 ;; M-g bindings (goto-map)
		 ("M-g e" . consult-compile-error)
		 ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
		 ("M-g g" . consult-goto-line)             ;; orig. goto-line
		 ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
		 ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
		 ("M-g m" . consult-mark)
		 ("M-g k" . consult-global-mark)
		 ("M-g i" . consult-imenu)
		 ("M-g I" . consult-imenu-multi)
		 ;; M-s bindings (search-map)
		 ("M-s f" . consult-find)
		 ("M-s F" . consult-locate)
		 ("M-s g" . consult-grep)
		 ("M-s G" . consult-git-grep)
		 ("M-s r" . consult-ripgrep)
		 ("M-s l" . consult-line)
		 ("M-s L" . consult-line-multi)
		 ("M-s m" . consult-multi-occur)
		 ("M-s k" . consult-keep-lines)
		 ("M-s u" . consult-focus-lines)
		 ;; Isearch integration
		 ("M-s e" . consult-isearch)
		 :map isearch-mode-map
		 ("M-e" . consult-isearch)                 ;; orig. isearch-edit-string
		 ("M-s e" . consult-isearch)               ;; orig. isearch-edit-string
		 ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
		 ("M-s L" . consult-line-multi))           ;; needed by consult-line to detect isearch

  ;; Enable automatic preview at point in the *Completions* buffer.
  ;; This is relevant when you use the default completion UI,
  ;; and not necessary for Vertico, Selectrum, etc.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0
		register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Optionally replace `completing-read-multiple' with an enhanced version.
  (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
		xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key (kbd "M-."))
  ;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme
   :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-file consult--source-project-file consult--source-bookmark
   :preview-key (kbd "M-."))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; (kbd "C-+")

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; Optionally configure a function which returns the project root directory.
  ;; There are multiple reasonable alternatives to chose from.
  ;;;; 1. project.el (project-roots)
  (setq consult-project-root-function
		(lambda ()
		  (when-let (project (project-current))
			(car (project-roots project)))))
  ;;;; 2. projectile.el (projectile-project-root)
  ;; (autoload 'projectile-project-root "projectile")
  ;; (setq consult-project-root-function #'projectile-project-root)
  ;;;; 3. vc.el (vc-root-dir)
  ;; (setq consult-project-root-function #'vc-root-dir)
  ;;;; 4. locate-dominating-file
  ;; (setq consult-project-root-function (lambda () (locate-dominating-file "." ".git")))
)

(use-package embark-consult)
(use-package wgrep)

(use-package marginalia
  :config
  (marginalia-mode))

(use-package embark
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-," . embark-export)
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
			   '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
				 nil
				 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)                 ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                  ;; Enable auto completion
  (corfu-commit-predicate t)      ;; Do not commit selected candidates on next input
  (corfu-quit-at-boundary t)      ;; Automatically quit at word boundary
  (corfu-quit-no-match t)         ;; Automatically quit if there is no match
  (corfu-echo-documentation 0)    ;; if NIL, do not show documentation in the echo area
  (corfu-auto-prefix 1)           ;; Run Corfu after 1 character is entered
  (corfu-auto-delay 0)            ;; No delay before trying to auto-complete
  (lsp-completion-provider :none) ;; Use corfu instead for lsp completions
  (tab-always-indent 'complete)   ;; Enable indentation+completion using the TAB key.

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Optionally use TAB for cycling, default is `corfu-complete'.
  :bind (:map corfu-map
		  ("C-j" . corfu-next)
		  ("C-k" . corfu-previous)
		  ("TAB" . corfu-next)
		  ([tab] . corfu-next)
		  ("S-TAB" . corfu-previous)
		  ([backtab] . corfu-previous)
		  ("<return>" . corfu-insert)
		  ("C-<return>" .
			(lambda ()
			  (interactive)
			  (corfu-quit)
			  (newline 1 t)))
		  ("M-d" . corfu-show-documentation)
		  ("M-l" . corfu-show-location))

  :init
  ;; This is recommended since dabbrev can be used globally (M-/).
  (global-corfu-mode))

;; Cool VSCode icons beside autocompletions in LSP
(use-package kind-icon
  :after corfu
  :custom
  (kind-icon-use-icons t)                 ;; Use icons 
  (kind-icon-default-face 'corfu-default) ;; Use corfu's background color
  (kind-icon-blend-background t)          ;; Use overlay icons on background color
  (kind-icon-blend-frac 0.12)             ;; Opacity of icon's background color from it's main color

  ;; `kind-icon' depends on `svg-lib' which creates a cache directory
  ;; that defaults to the `user-emacs-directory'.
  ;; Here, I change that directory to a location appropriate to
  ;; `no-littering' conventions, a package which moves directories
  ;; of other packages to sane locations.
  (svg-lib-icons-dir (no-littering-expand-var-file-name "svg-lib/cache/"))
  :config
  ;; Enable kind-icon in corfu
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)
  ;; TODO: This adds a hook to reset icon cache, setting correct background color 
  ;; when I run the custom command for switching themes. (I haven't created this yet)
  (add-hook 'hamza/themes-hooks #'(lambda () (interactive) (kind-icon-reset-cache))))

;; ;; Dabbrev works with Corfu
;; (use-package dabbrev
;;   ;; Swap M-/ and C-M-/
;;   :bind (("M-/" . dabbrev-completion)
;;          ("C-M-/" . dabbrev-expand)))

(use-package doom-modeline
      :init (doom-modeline-mode 1))

;; IMPORTANT: RUN THIS AT FIRST INSTALL
    ;; Installs all fonts for the doom-modeline
    ;(all-the-icons-install-fonts)

    ;;(add-to-list 'load-path "~/.emacs.d/lisp/icons-in-terminal.el")
    ;;(require 'icons-in-terminal)

;; (use-package buffer-flip
;;   :init
;;   (require 'cl-lib)
;;   :bind  (("M-<tab>" . buffer-flip)
;;           :map buffer-flip-map
;;           ( "M-<tab>" .   buffer-flip-forward)
;;           ( "M-<iso-lefttab>" . buffer-flip-backward)
;;           ( "M-ESC" .     buffer-flip-abort))
;;   :config
;;   (setq buffer-flip-skip-patterns
;;         '("^\\*helm\\b"
;;           "^\\*swiper\\*$")))

;; (global-set-key (kbd "<M-tab>") #'iflipb-next-buffer)
;; (global-set-key (kbd "<M-S-iso-lefttab>") #'iflipb-previous-buffer))

;; (use-package iflipb
;;   :bind (("M-<tab>" . iflipb-next-buffer)
;;          ("M-<iso-lefttab>" . iflipb-previous-buffer)))

(use-package nswbuff
  :bind (("C-<tab>" . nswbuff-switch-to-next-buffer)
		 ("C-<iso-lefttab>" . nswbuff-switch-to-previous-buffer)))

;; (use-package buffer-flip
;;   :bind  (("M-<tab>" . buffer-flip)
;;           :map buffer-flip-map
;;           ( "M-<tab>" .   buffer-flip-forward)
;;           ( "M-<iso-lefttab>" . buffer-flip-backward)
;;           ( "M-ESC" .     buffer-flip-abort))
;;   :config
;;   (setq buffer-flip-skip-patterns
;;         '("^\\*helm\\b"
;;           "^\\*swiper\\*$")))

(use-package magit
  :defer t)

(use-package keychain-environment
  :defer t)

(use-package flyspell-popup
  :defer t
  :config
  (define-key flyspell-mode-map (kbd "C-;") #'flyspell-popup-correct)
  (add-hook 'flyspell-mode-hook #'flyspell-popup-auto-correct-mode))

(use-package org
  :config
  (setq org-confirm-babel-evaluate nil)
  (setq org-ellipsis " ???")
  (setq org-agenda-files
		'("~/wrk/tasks.org"))

  ;(add-hook 'org-mode-hook 'turn-on-flyspell)
  (add-hook 'org-mode-hook 'turn-on-auto-fill)

  (setq org-agenda-start-with-log-mode t) ;; present a log
  (setq org-log-done 'note)
  (setq org-log-into-drawer t)) ;; show time when things are done ('time) or ask for a note ('note)

;; 'org-store-link allows to create a link to any header in any org mode file.
;; and if you run 'org-insert-link right after that, you can insert a link to goto that heading
;; for now, to go to the link you have to click the link
;(global-set-key (kbd "C-c l") 'org-store-link)
;(global-set-key (kbd "C-c C-l") 'org-insert-link)

;; Replaced by org-superstar
;; (use-package org-bullets
;;   :hook (org-mode . org-bullets-mode))
;;   ;; :config
;;   ;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-superstar
  :hook (org-mode . org-superstar-mode))
  ;; :config
  ;; (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

;; Set Images and Latex Preview size correctly
(setq org-image-actual-width nil)
(setq org-hide-emphasis-markers t)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

(use-package olivetti
  :hook (org-mode . olivetti-mode)
  :init
  (setq olivetti-body-width 90)
  (setq fill-column 80)
  (add-hook 'olivetti-mode-hook 'hamza/default-olivetti-resize))

;; (use-package org-drill
;;   :hook (org-mode . org-drill))

;; (use-package org-noter
;;   :defer t
;;   :config
;;   (setq org-noter-default-notes-file-names '("notes.org")) ; Main File
;;   (setq org-noter-notes-search-path '("~/org/research-notes/notes")) ; Main Directory
;;   (setq org-noter-separate-notes-from-heading t)) ; keep an empty line between headings and content

;; (use-package org-roam
;;   :defer t
;;   :hook
;;   (after-init . org-roam-mode)
;;   :custom
;;   (org-roam-directory "~/org/org-roam"))

;; Allows drag and drop of images to download
(use-package org-download)

;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)
(add-hook 'dired-mode-hook (lambda () (text-scale-increase 2)))

(use-package all-the-icons-dired
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package treemacs
  :config
  (treemacs-resize-icons 24))

;(use-package treemacs-icons-dired
  ;:after treemacs dired
  ;:config
  ;(treemacs-icons-dired-mode))
;(use-package treemacs-all-the-icons)

;(setq dired-listting-switches )

(org-babel-do-load-languages 'org-babel-load-languages
   '((shell . t)
(latex . t)))

(use-package projectile
  :defer t)

;; displays the character your point is at in a line
(column-number-mode t)

(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
				term-mode-hook
				shell-mode-hook
				eshell-mode-hook
				vterm-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Too slow
;;(use-package nlinum-relative)

(use-package yafolding
  :config
  (defvar yafolding-mode-map
  (let ((map (make-sparse-keymap)))
	(define-key map (kbd "<C-S-return>") #'yafolding-hide-parent-element)
	(define-key map (kbd "<C-M-return>") #'yafolding-toggle-all)
	(define-key map (kbd "<C-return>") #'yafolding-toggle-element)
	map)))

(use-package fold-this
  :config
  (global-set-key (kbd "C-c C-f") 'fold-this-all)
  (global-set-key (kbd "C-c C-F") 'fold-this)
  (global-set-key (kbd "C-c M-f") 'fold-this-unfold-all))

;; Rainbow delimiters (and/or parenthesis)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))


(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t))

  ;; You Just CANT remove a parenthesis even if you are going to fix it later with this mode
  ;; But if you like "dd" a line it will "dd" the line but not remove other parenthesis
  ;; Below two lines will automatically start this mode when smartparens mode is enabled

  ;;(add-hook 'smartparens-enabled-hook #'smartparens-strict-mode)
  ;;(add-hook 'smartparens-global-mode-hook #'smartparens-global-mode-hook))

;; Which key helps find commands by popping a panel
(use-package which-key
  :diminish which-key-mode
  :init (which-key-mode)
  ;; :after-init
  ;; (setq which-key-idle-delay 0.2)
  :config
  (setq which-key-idle-delay 0.2)) ; delay before popping up the which-key panel

;; (use-package which-key-posframe)

(use-package helpful
  :defer t
  ;; :custom
  ;; (counsel-describe-function-function #'helpful-callable)
  ;; (counsel-describe-variable-function #'helpful-variable)
  ;; :bind
  ;; ([remap describe-function] . counsel-describe-function)
  ;; ([remap describe-command] . helpful-command)
  ;; ([remap describe-variable] . counsel-describe-variable)
  ;; ([remap describe-key] . helpful-key)
)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil) ; Adds more vim bindings to other parts of emacs. I use evil-collection instead
  (setq evil-want-minibuffer t) ; Enables evil in the minibuffer
  (setq evil-want-C-u-scroll nil) ; Use C-u as go up instead of universal argument
  (setq evil-want-C-i-jump nil)
  (setq evil-want-Y-yank-to-eol t) ; Make Shift-Y yank to end of line instead of yanking whole line
  ;(setq evilmi-may-jump-by-percentage nil)
  :config
  (evil-mode t) ; Enable Evil
  ;;WHY??? ok i kind of understand.
  ;(add-hook 'eaf-mode (lambda () (evil-mode nil)))

  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state) ; Use C-g to go to Normal State
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join) ; Use C-h as backspace
  (define-key evil-normal-state-map (kbd "u") 'undo-tree-undo)
  (define-key evil-normal-state-map (kbd "U") 'undo-tree-redo)

  (define-key evil-normal-state-map (kbd "H") 'evil-digit-argument-or-evil-beginning-of-line)
  (define-key evil-visual-state-map (kbd "H") 'evil-digit-argument-or-evil-beginning-of-line)
  (define-key evil-normal-state-map (kbd "L") 'evil-end-of-line)
  (define-key evil-visual-state-map (kbd "L") 'evil-end-of-line)

  ;; (define-key evil-normal-state-map (kbd "C-l o") 'org-open-at-point)
  ;; (define-key evil-normal-state-map (kbd "C-l b") 'org-mark-ring-goto)
  ;; (define-key evil-normal-state-map (kbd "C-l i") 'org-insert-link)
  ;; (define-key evil-normal-state-map (kbd "C-l s") 'org-store-link)

  ;; (define-key evil-normal-state-map (kbd "J") 'pixel-scroll-up)
  ;; (define-key evil-normal-state-map (kbd "K") 'pixel-scroll-down)

  (define-key evil-normal-state-map (kbd "g l") 'evil-avy-goto-line)
  (define-key evil-normal-state-map (kbd "g w") 'evil-avy-goto-word-or-subword-1)
  (define-key evil-normal-state-map (kbd "g c") 'evil-avy-goto-char)
  (define-key evil-normal-state-map (kbd "g 2 c") 'evil-avy-goto-char-2)
  (define-key evil-normal-state-map (kbd "g b") 'avy-pop-mark)

  ;; Use visual line motions even outside of visual-line-mode buffers)
  ;(evil-global-set-key 'motion "j" 'evil-next-visual-line)
  ;(evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  ;; Start in Normal State for these buffer modes
  ;(evil-set-initial-state 'messages-buffer-mode 'normal)
  ;(evil-set-initial-state 'dashboard-mode 'normal)
  )

;; Have intuitive evil keybindings in a LOT of extra modes
(use-package evil-collection
  :after evil ; Load after evil
  :config
  (evil-collection-init))

;; Adds tooooons of useful keybindings for org-mode with evil
(use-package evil-org
      :after evil org
      :config
      ;; evil-org unconditionally remaps `evil-quit' to `org-edit-src-abort' which I
      ;; don't like because it results in `evil-quit' keybinding invocations to not
      ;; quit the window.
      (when (command-remapping 'evil-quit nil org-src-mode-map)
	(define-key org-src-mode-map [remap evil-quit] nil))

      (add-hook 'org-mode-hook 'evil-org-mode)
      (add-hook 'evil-org-mode-hook
			(lambda ()
			      (evil-org-set-key-theme '(operators
										navigation
										textobjects)))))

;; evil version of smartparens few benifits but works better and better strict mode
(use-package evil-smartparens
      :after evil
      :config
      ;; (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
      ;; (add-hook 'smartparens-global-mode-hook #'evil-smartparens-mode))
      )

;; surround anything with anything
(use-package evil-surround
      :after evil
      :config
      (global-evil-surround-mode 1))

;; align anything
(use-package evil-lion
      :after evil
      :config
      (evil-lion-mode))

;; exchange anything
(use-package evil-exchange
      :after evil
      :config
      (evil-exchange-install))

;; Visually shows you what you are about to do with evil
(use-package evil-goggles
      :after evil
      :config
      (evil-goggles-mode 0)
      (evil-goggles-use-diff-faces))

;; multiple cursors, quite nice but annoying you HAVE to be in visual mode!
(use-package evil-mc
      :after evil
      :config
      (global-evil-mc-mode t))

;; Pops up a window and allows you to view registers and marks before using them.
	  ;; (use-package evil-owl
;;		:config
;;		(setq evil-owl-display-method 'posframe
;;			  evil-owl-extra-posframe-args '(:width 50 :height 20)
;;			  evil-owl-max-string-length 50)
;;
;;		(defun mpereira/update-evil-owl-posframe-args ()
;;			(interactive)
;;			(setq evil-owl-extra-posframe-args
;;				`(:width 80
;;					:height 20
;;					:background-color ,(face-attribute 'ivy-posframe :background nil t)
;;					:foreground-color ,(face-attribute 'ivy-posframe :foreground nil t)
;;					:internal-border-width ,ivy-posframe-border-width
;;					:internal-border-color ,(face-attribute 'ivy-posframe-border
;;															:background
;;															nil
;;															t))))
;;
;;		;; This needs to run after the initial theme load.
;;		(add-hook 'after-init-hook 'mpereira/update-evil-owl-posframe-args 'append)
;;		(add-hook 'after-load-theme-hook 'mpereira/update-evil-owl-posframe-args)
;;
;;		(evil-owl-mode))

;; comment without selecting and more effecient, does not need evil
(use-package evil-nerd-commenter
      :after evil)

;; Hit % and basically EVERY language will jump between tags
(use-package evil-matchit
      :after evil
      :config
      (global-evil-matchit-mode 1))

;; (use-package xah-fly-keys
;;   :init
;;   (xah-fly-keys-set-layout "qwerty"))

;; (use-package boon
;;   :config
;;   (require 'boon-qwerty))

;; (defun meow-setup ()
;;   (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
;;   (meow-motion-overwrite-define-key
;;    '("j" . meow-next)
;;    '("k" . meow-prev))
;;   (meow-leader-define-key
;;    ;; SPC j/k will run the original command in MOTION state.
;;    '("j" . meow-motion-origin-command)
;;    '("k" . meow-motion-origin-command)
;;    ;; Use SPC (0-9) for digit arguments.
;;    '("1" . meow-digit-argument)
;;    '("2" . meow-digit-argument)
;;    '("3" . meow-digit-argument)
;;    '("4" . meow-digit-argument)
;;    '("5" . meow-digit-argument)
;;    '("6" . meow-digit-argument)
;;    '("7" . meow-digit-argument)
;;    '("8" . meow-digit-argument)
;;    '("9" . meow-digit-argument)
;;    '("0" . meow-digit-argument)
;;    '("/" . meow-keypad-describe-key)
;;    '("?" . meow-cheatsheet))
;;   (meow-normal-define-key
;;    '("0" . meow-expand-0)
;;    '("9" . meow-expand-9)
;;    '("8" . meow-expand-8)
;;    '("7" . meow-expand-7)
;;    '("6" . meow-expand-6)
;;    '("5" . meow-expand-5)
;;    '("4" . meow-expand-4)
;;    '("3" . meow-expand-3)
;;    '("2" . meow-expand-2)
;;    '("1" . meow-expand-1)
;;    '("-" . negative-argument)
;;    '(";" . meow-reverse)
;;    '("," . meow-inner-of-thing)
;;    '("." . meow-bounds-of-thing)
;;    '("[" . meow-beginning-of-thing)
;;    '("]" . meow-end-of-thing)
;;    '("a" . meow-append)
;;    '("A" . meow-open-below)
;;    '("b" . meow-back-word)
;;    '("B" . meow-back-symbol)
;;    '("c" . meow-change)
;;    '("C" . meow-change-save)
;;    '("d" . meow-C-d)
;;    '("D" . meow-backward-delete)
;;    '("e" . meow-next-word)
;;    '("E" . meow-next-symbol)
;;    '("f" . meow-find)
;;    '("F" . meow-find-expand)
;;    '("g" . meow-cancel)
;;    '("G" . meow-grab)
;;    '("h" . meow-left)
;;    '("H" . meow-left-expand)
;;    '("i" . meow-insert)
;;    '("I" . meow-open-above)
;;    '("j" . meow-next)
;;    '("J" . meow-next-expand)
;;    '("k" . meow-prev)
;;    '("K" . meow-prev-expand)
;;    '("l" . meow-right)
;;    '("L" . meow-right-expand)
;;    '("m" . meow-join)
;;    '("n" . meow-search)
;;    '("N" . meow-pop-search)
;;    '("o" . meow-block)
;;    '("O" . meow-block-expand)
;;    '("p" . meow-yank)
;;    '("P" . meow-yank-pop)
;;    '("q" . meow-quit)
;;    '("Q" . meow-goto-line)
;;    '("r" . meow-replace)
;;    '("R" . meow-swap-grab)
;;    '("s" . meow-kill)
;;    '("t" . meow-till)
;;    '("T" . meow-till-expand)
;;    '("u" . meow-undo)
;;    '("U" . meow-undo-in-selection)
;;    '("v" . meow-visit)
;;    '("V" . meow-kmacro-matches)
;;    '("w" . meow-mark-word)
;;    '("W" . meow-mark-symbol)
;;    '("x" . meow-line)
;;    '("X" . meow-kmacro-lines)
;;    '("y" . meow-save)
;;    '("Y" . meow-sync-grab)
;;    '("z" . meow-pop-selection)
;;    '("Z" . meow-pop-all-selection)
;;    '("&" . meow-query-replace)
;;    '("%" . meow-query-replace-regexp)
;;    '("'" . repeat)
;;    '("\\" . quoted-insert)
;;    '("<escape>" . meow-last-buffer)))

;; (use-package meow
;;   :demand t
;;   :init
;;   (meow-global-mode 0)
;;   :config
;;   (meow-setup)
;;   (meow-setup-line-number)
;;   (meow-setup-indicator))

;; ;; Cursors start
;; (use-package multiple-cursors
;;   :config
;;   (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;;   (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;;   (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;;   (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; (use-package visual-regexp-steroids
;;   :config
;;   (define-key global-map (kbd "C-c r") 'vr/replace)
;;   (define-key global-map (kbd "C-c q") 'vr/query-replace)

;;   ;; to use visual-regexp-steroids's isearch instead of the built-in regexp isearch
;;   ;(define-key esc-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s
;;   ;(define-key esc-map (kbd "C-r") 'vr/isearch-backward)) ;; C-M-r

;;   ;; if you use multiple-cursors, this is for you:
;;   (define-key global-map (kbd "C-c m") 'vr/mc-mark))

(use-package evil-multiedit
  :after evil
  :config
  (evil-multiedit-default-keybinds)
  ;; (setq evil-multiedit-follow-matches t)
  )

;; be in a state like when you press C-x C-+ and then just press +, - or 0
(use-package hydra
  :defer 2
  :bind ("C-c c" . hydra-clock/body)
		("C-c z" . hydra-zoom/body)
		("C-c r" . hydra-launcher/body)
		("C-c w" . hydra-move-splitter/body))

(defhydra hydra-zoom ()
  "Zoom"
  ("k" text-scale-increase "in")
  ("j" text-scale-decrease "out"))

(defhydra hydra-launcher (:color blue)
   "Launch"
   ("h" woman "woman")
   ("r" (browse-url "http://www.reddit.com/r/emacs/") "reddit")
   ("w" (browse-url "http://www.emacswiki.org/") "emacswiki")
   ("s" shell "shell")
   ("q" nil "cancel"))

(defun hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
		(windmove-find-other-window 'right))
	  (shrink-window-horizontally arg)
	(enlarge-window-horizontally arg)))

(defhydra hydra-move-splitter ()
  "Grow or shrink the current window"
  ("h" evil-window-decrease-width "shrink width")
  ("k" evil-window-decrease-height "shrink height")
  ("j" evil-window-increase-height "grow height")
  ("l" evil-window-increase-width "grow width"))

(defhydra hydra-clock (:color blue)
	"
	^
	^Clock^             ^Do^
	^???????????????^???????????????????????????????????????^??????^???????????????????????????
	_q_ quit            _c_ cancel
	^^                  _d_ display
	^^                  _e_ effort
	^^                  _i_ in
	^^                  _j_ jump
	^^                  _o_ out
	^^                  _r_ report
	^^                  ^^
	"
	("q" nil)
	("c" org-clock-cancel :color pink)
	("d" org-clock-display)
	("e" org-clock-modify-effort-estimate)
	("i" org-clock-in)
	("j" org-clock-goto)
	("o" org-clock-out)
	("r" org-clock-report))

;; For Nix, direnv, .envrc and lorri
(use-package direnv
  :config
  (direnv-mode))

(use-package term
  :config
  (setq explicit-shell-file-name "bash")
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))

;; 256 terminal colors yayyyy
(use-package eterm-256color
  :config
  (add-hook 'term-mode-hook 'eterm-256color-mode))

;; (use-package multi-term
;;   :config
;;   (setq multi-term-program nil))

(defun vterm-directory-sync ()
  "Synchronize current working directory."
  (interactive)
  (when vterm--process
	(let* ((pid (process-id vterm--process))
			(dir (file-truename (format "/proc/%d/cwd/" pid))))
	  (setq default-directory dir))))

(use-package vterm
  :commands vterm
  :config
  (add-hook 'vterm-mode-hook
	(lambda ()
	  (set (make-local-variable 'buffer-face-mode-face) 'fixed-pitch)
	  (buffer-face-mode t)))

  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")
  ;;(setq vterm-shell "zsh")
  (setq vterm-max-scrollback 10000)
  (add-to-list 'vterm-eval-cmds
	'("update-pwd" (lambda (path) (setq default-directory path)))))

;;;;;;;;;;;;;;;;;;;;EVIL VTERM;;;;;;;;;;;;;;START;;;;

;; ;; (use-package vterm-extra
;; ;;   :load-path "custom/vterm-extra"
;; ;;   :bind (("s-t" . vterm-extra-dispatcher)
;; ;; 		  :map vterm-mode-map
;; ;; 		  (("C-c C-e" . vterm-extra-edit-command-in-new-buffer))))

;; (defvar vterm-extra-line-mode-map nil)
;; (setq vterm-extra-line-mode-map (make-sparse-keymap))

;; (define-key vterm-extra-line-mode-map (kbd "<return>")
;;   'vterm-extra-read-and-send)

;; (define-minor-mode vterm-extra-line-mode ;"VTermLine"
;;   "Vterm extra line mode."
;;   :global nil
;;   :lighter " VTerm-line-mode"
;;   (read-only-mode -1))

;; (defun vterm-extra-read-and-send ()
;;   (interactive)
;;   (let ((command (buffer-substring-no-properties
;; 				 (vterm--get-prompt-point) (vterm--get-end-of-line))))
;; 	(vterm-send-C-a)
;; 	(vterm-send-C-k)
;; 	(vterm-send-string command)
;; 	(vterm-send-return)))

;; (defun evil-collection-vterm-insert (count &optional vcount skip-empty-lines)
;;   (interactive
;;    (list (prefix-numeric-value current-prefix-arg)
;;          (and (evil-visual-state-p)
;;               (memq (evil-visual-type) '(line block))
;;               (save-excursion
;;                 (let ((m (mark)))
;;                   ;; go to upper-left corner temporarily so
;;                   ;; `count-lines' yields accurate results
;;                   (evil-visual-rotate 'upper-left)
;;                   (prog1 (count-lines evil-visual-beginning evil-visual-end)
;;                     (set-mark m)))))
;;          (evil-visual-state-p)))
;;   (evil-insert count vcount skip-empty-lines)
;;   (let ((p (point)))
;;     (vterm-reset-cursor-point)
;;     (while (< p (point))
;;       (vterm-send-left)
;;       (forward-char -1))
;;     (while (> p (point))
;;       (vterm-send-right)
;;       (forward-char 1))))

;; (evil-collection-define-key 'normal 'vterm-mode-map "i" 'evil-collection-vterm-insert)

;; (defun vterm-evil-insert ()
;;   (interactive)
;;   (vterm-goto-char (point))
;;   (call-interactively #'evil-insert))

;; (defun vterm-evil-append ()
;;   (interactive)
;;   (vterm-goto-char (1+ (point)))
;;   (call-interactively #'evil-append))

;; (defun vterm-evil-delete ()
;;   "Provide similar behavior as `evil-delete'."
;;   (interactive)
;;   (let ((inhibit-read-only t))
;;     (cl-letf (((symbol-function #'delete-region) #'vterm-delete-region))
;;       (call-interactively 'evil-delete))))

;; (defun vterm-evil-change ()
;;   "Provide similar behavior as `evil-change'."
;;   (interactive)
;;   (let ((inhibit-read-only t))
;;     (cl-letf (((symbol-function #'delete-region) #'vterm-delete-region))
;;       (call-interactively 'evil-change))))

;; (defun my-vterm-hook()
;;   (evil-local-mode 1)
;;   (evil-define-key 'normal 'local "a" 'vterm-evil-append)
;;   (evil-define-key 'normal 'local "d" 'vterm-evil-delete)
;;   (evil-define-key 'normal 'local "i" 'vterm-evil-insert)
;;   (evil-define-key 'normal 'local "c" 'vterm-evil-change))

;; (add-hook 'vterm-mode-hook 'my-vterm-hook)

;;;;;;;;;;;;;;;;;;;;EVIL VTERM;;;;;;;;;;;;;;;;END

(use-package multi-vterm
  :config
  (add-hook 'vterm-mode-hook
	(lambda ()
										;(setq-local evil-insert-state-cursor 'box)
	  (evil-insert-state)))
  ;; (define-key vterm-mode-map [return]                      #'vterm-send-return)

  (setq vterm-keymap-exceptions nil)
  (evil-define-key 'insert vterm-mode-map (kbd "C-e")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-f")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-a")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-v")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-b")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-w")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-u")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-d")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-n")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-m")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-p")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-j")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-k")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-r")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-t")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-g")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-c")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "M-SPC")    nil)
  (evil-define-key 'normal vterm-mode-map (kbd "C-d")      #'vterm--self-insert)
  (evil-define-key 'normal vterm-mode-map (kbd ",c")       #'multi-vterm)
  (evil-define-key 'normal vterm-mode-map (kbd ",n")       #'multi-vterm-next)
  (evil-define-key 'normal vterm-mode-map (kbd ",p")       #'multi-vterm-prev)
  (evil-define-key 'normal vterm-mode-map (kbd "i")        #'evil-insert-resume)
  (evil-define-key 'normal vterm-mode-map (kbd "o")        #'evil-insert-resume)
  ;; (evil-define-key 'normal vterm-mode-map (kbd "<return>") #'evil-insert-resume)
  )

										;(advice-add :before #'find-file #'vterm-directory-sync)

;; (defun vterm-find-file ()
;;   "Start vterm-directory-sync before find-file"
;;   (interactive)
;;   (vterm-directory-sync)
;;   (counsel-find-file))

;; Add ConTeXt to my Emacs Path so that eshell, term etc. could use them
(add-to-list 'exec-path "/home/hamza/.src/context-linux/tex/texmf-linux/bin")

;; Annoying to download so commenting for now
;; (use-package pdf-tools
;;   :config
;;   (pdf-tools-install)
;;   (setq-default pdf-view-display-size 'fit-page)
;;   (setq pdf-annot-activate-created-annotations t)
;;   (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
;;   (define-key pdf-view-mode-map (kbd "C-r") 'isearch-backward)
;;   (add-hook 'pdf-view-mode-hook (lambda ()
;; 								  (bms/pdf-midnite-amber)))) ; automatically turns on midnight-mode for pdfs

;; (use-package auctex
;;   :defer t
;;   :ensure auctex
;;   :config
;;   (setq TeX-PDF-mode t))

(use-package auctex-latexmk
  :config
  (auctex-latexmk-setup)
  (setq auctex-latexmk-inherit-TeX-PDF-mode t))

(use-package reftex
  :defer t
  :config
  (setq reftex-site-prompt-optional-args t)) ;; Prompt for empty optional arguments in cite

(use-package auto-dictionary
  :init
  (add-hook 'flyspell-mode-hook (lambda ()
								  (auto-dictionary-mode 1))))

;; (use-package company-auctex
;;   :init (company-auctex-init))

(use-package tex
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq TeX-source-correlate-mode t                            ;; Forward and inverse search
		TeX-source-correlate-method 'synctex                   ;; Search forward and backward with synctex method
		TeX-auto-save t                                        ;; Auto save file if not saved within certain time
		TeX-parse-self t)                                      ;; Parse file after loading it if no style hook is found for it.
  (setq-default TeX-master "paper.tex")                        ;; Master file associated with the current buffer
  (setq reftex-plug-into-AUCTeX t)                             ;; Use reftex with auctex
  (pdf-tools-install)                                          ;; Make sure pdf-tools is setup
  (setq TeX-view-program-selection '((output-pdf "PDF Tools")) ;; Output through pdf-tools
		TeX-source-correlate-start-server t)                   ;; Start the search server with tex

  ;; Update PDF buffers after successful LaTeX runs
  (add-hook 'TeX-after-compilation-finished-functions
			#'TeX-revert-document-buffer)

  ;; Turn on reftex and flyspell modes
  (add-hook 'LaTeX-mode-hook
	  (lambda ()
		(reftex-mode t)
		(flyspell-mode t))))

;; (use-package auto-complete
;;   :diminish
;;   :init
;;   (require 'auto-complete-config)
;;   :config
;;   (ac-config-default))

(use-package yasnippet-snippets)
(use-package yasnippet
  :diminish
  :config
  (yas-global-mode 1))

(use-package iedit
  ;:config
  ;; A bug fix for maybe a bug for macintosh
  ;(global-set-key (kbd "C-c ;") 'iedit)
  )

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((c-mode . lsp)
		 (c++-mode . lsp)
		 (html-mode . lsp)
		 (css-mode . lsp)
		 (rjsx-mode . lsp))
  :init
  (setq lsp-keymap-prefix "C-c l") ;; Or Space L
  :config
  (lsp-enable-which-key-integration t))

;; TODOOOOO: Consult-LSP
(setq gc-cons-threshold (* 100 1024 1024)
	  read-process-output-max (* 1024 1024)
	  treemacs-space-between-root-nodes nil
	  company-idle-delay 0.0
	  company-minimum-prefix-length 1
	  lsp-idle-delay 0.1)  ;; clangd is fast


;; (use-package lsp-mode
;;   :commands (lsp lsp-deffered)
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")
;;   (add-hook 'haskell-mode-hook #'lsp)
;;   (add-hook 'haskell-literate-mode-hook #'lsp)
;;   :config
;;   (message "Loaded LSP")
;;   (lsp-enable-which-key-integration t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Needs hls-hlint-plugin which needs ghcide which is 64 bit :( ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package lsp-mode
;;   :commands (lsp lsp-deferred)
;;   :init
;;   (setq lsp-keymap-prefix "C-c l") ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   :hook ((haskell-mode . lsp-deferred) ;; replace haskell-mode with concrete major-mode(e. g. python-mode)
;;          (lsp-mode . lsp-enable-which-key-integration))) ;; if you want which-key integration

;; (use-package lsp-ui :commands lsp-ui-mode)
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; ;; LSP debugger
;; (use-package dap-mode)
;; (use-package dap-haskell) ; to load the dap adapter for haskell

;; (use-package slime
;;   :config
;;   (setq inferior-lisp-program "sbcl"))

;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)

(use-package paredit
  :config
  (add-hook 'paredit-mode-hook #'evil-paredit-mode))

(use-package evil-paredit)

(use-package paredit-everywhere
  :config
  (add-hook 'prog-mode-hook 'paredit-everywhere-mode))

(use-package sly
  :config
  (setq inferior-lisp-program "sbcl")
  ;; (add-hook 'sly-mode-hook 'set-up-sly-ac)
  ;; (eval-after-load 'auto-complete
  ;;   '(add-to-list 'ac-modes 'sly-mrepl-mode))
  ;; (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  ;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  ;; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  ;; (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  ;; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  ;; (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
  )

(use-package hindent
  :defer t)

(use-package haskell-mode
  :defer t
  :mode ".*.hs"
  :init
  :config
  (message "Loaded haskell-mode")
  (setq haskell-indent-level 2)
  (setq haskell-mode-stylish-haskell-path "brittany"))

;; (use-package haskell-mode
;;   :defer t
;;   :mode ".*.hs"
;;   :mode ".*.hsl"
;;   :hook (haskell-mode . lsp-deffered)
;;   :bind (:map haskell-mode-map
;; 			  ("C-c h" . hoogle)
;; 			  ("C-c s" . haskell-mode-stylish-buffer))
;;   :init
;;   (add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
;;   (add-hook 'haskell-mode-hook #'lsp)
;;   (add-hook 'haskell-literate-mode-hook #'lsp)
;;   :config
;;   (message "Loaded haskell-mode")
;;   (setq haskell-indent-level 4)
;;   (setq haskell-mode-stylish-haskell-path "brittany"))

;; (use-package lsp-haskell
;;   :defer t
;;   :after lsp
;;   :init
;;   (require 'cl-lib)
;;   :config
;;   (message "Loaded lsp-haskell"))

(use-package lua-mode
      :defer t)

(use-package nim-mode
      :defer t)

(use-package j-mode
   :defer t
   :init
   (setq j-console-cmd "jconsole"))

(use-package nix-mode
      :defer t)

(use-package cmake-mode
      :defer t)

(defun em-gnu-apl-init ()
  (setq buffer-face-mode-face 'gnu-apl-default)
  (buffer-face-mode)
  (set-input-method "APL-Z"))

(use-package gnu-apl-mode
  :defer t
  :config
  (add-hook 'gnu-apl-interactive-mode-hook 'em-gnu-apl-init)
  (add-hook 'gnu-apl-mode-hook 'em-gnu-apl-init))

(use-package web-mode
      ;; :defer t ;; Makes it not work
      ;; File formats
      :mode (("\\.html?\\'" . web-mode)
		      ("\\.phtml\\'" . web-mode)
		      ("\\.djhtml\\'" . web-mode)
		      ("\\.css?\\'" . web-mode)
		      ("\\.ts\\'" . web-mode)
		      ("\\.tpl\\'" . web-mode)
		      ("\\.[agj]sp\\'" . web-mode)
		      ("\\.as[cp]x\\'" . web-mode)
		      ("\\.erb\\'" . web-mode)
		      ("\\.mustache\\'" . web-mode))
      :config
      ;; Hooks
      ;; (add-hook 'html-mode-hook 'web-mode)
      ;; (add-hook 'css-mode-hook 'web-mode)
      ;; (add-hook 'js-mode-hook 'web-mode)
      ;; (add-hook 'sgml-mode-hook 'web-mode)

      ;; Enable JSX syntax highlighting in .js/.jsx files
      ;; (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

      ;; Indentation
      (setq web-mode-markup-indent-offset 2)
      (setq web-mode-css-indent-offset 2)
      (setq web-mode-code-indent-offset 2)
      (setq web-mode-attr-indent-offset 2)

      ;; Features
      (setq web-mode-enable-auto-pairing 1)
      ;; (setq web-mode-enable-css-colorization 1)
      ;; (setq web-mode-enable-current-element-highlight 1)
      (setq web-mode-enable-auto-closing 1)

      ;; Auto-complete
      ;; Disable the default flycheck jslint:
      ;; (setq-default flycheck-disabled-checkers
      ;;   (append flycheck-disabled-checkers
      ;;     '(javascript-jshint json-jsonlist)))

      (setq web-mode-ac-sources-alist
	'(("css" . (ac-source-css-property))
	      ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

      ;; Enable prettier-js-mode for files in a project with prettier (this will use the projects .prettierrc)
      (add-node-modules-path)
      (prettier-js-mode)
      (rjsx-mode))

(use-package emmet-mode
      ;; :defer t ;; Makes it not work
      ;; useless automatically works
      ;; :bind (("<C-return>" . hamza/emmet-tab)
      ;;        ("C-j" . emmet-expand-line))
      :hook web-mode)

;; (add-hook 'js2-mode-hook 'skewer-mode)
;; (add-hook 'css-mode-hook 'skewer-css-mode)
;; (add-hook 'html-mode-hook 'skewer-html-mode)

(use-package skewer-mode
      :hook ((js2-mode . skewer-mode)
		 (css-mode . skewer-css-mode)
		 (html-mode . skewer-html-mode)))

(use-package impatient-mode
      :hook web-mode)

;; (use-package flycheck-mode
;;   :hook web-mode
;;   :config
;;   ;; Enable eslint checker for web-mode
;;   (flycheck-add-mode 'javascript-eslint 'web-mode))

;; (use-package add-node-modules-path
;;   :hook flycheck-mode)

;; (use-package js2-mode
;;   :hook web-mode)

(use-package rjsx-mode
      :mode (("\\.jsx?$" . rjsx-mode))
      :config
      (setf tab-width 4
		js-indent-level 2))

(use-package prettier-js
      :hook (rjsx-mode . prettier-js-mode))

;; (defun hamza/ac-c-header-init ()
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   (add-to-list 'achead:include-directories '"/usr/lib32/gcc/i686-pc-linux-gnu/10.2.1/include"))

;; (use-package auto-complete-c-headers
;;   :init
;;   (add-hook 'c-mode-hook 'hamza/ac-c-header-init)
;;   (add-hook 'c++-mode-hook 'hamza/ac-c-header-init))

;; (defun hamza/flymake-google-init ()
;;   (require 'flymake-google-cpplint)
;;   (custom-set-variables
;;    '(flymake-google-cpplint-command "cpplint"))
;;   (flymake-google-cpplint-load))

;; (use-package flymake-google-cpplint
;;   :init
;;   (add-hook 'c-mode-hook 'hamza/flymake-google-init)
;;   (add-hook 'c++-mode-hook 'hamza/flymake-google-init))

;; (use-package flymake-cursor
;;   :config
;;   (flymake-cursor-mode))

;; (use-package google-c-style
;;   :init
;;   (add-hook 'c-mode-common-hook 'google-set-c-style)
;;   (add-hook 'c-mode-common-hook 'google-make-newline-indent))

(use-package eimp
    :defer t)

(use-package quelpa
	     :defer t)
;; Run when First Run
;; (quelpa '(eaf :fetcher github
;;               :repo  "manateelazycat/emacs-application-framework"
;;               :files ("*")))

;; (use-package eaf
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework" ;Set to "/usr/share/emacs/site-lisp/eaf" if from AUR
;;   :init
;;   (use-package epc :defer t)
;;   (use-package ctable :defer t)
;;   (use-package deferred :defer t)
;;   (use-package s :defer t :ensure t)
;;   :custom
;;   (eaf-browser-continue-where-left-off t)
;;   :config
;;   (eaf-setq eaf-browser-enable-adblocker "true")
;;   (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key take_photo "p" eaf-camera-keybinding)
;;   (eaf-bind-key nil "M-q" eaf-browser-keybinding)) ;; unbind, see more in the

(defun hamza/insert-line-below ()
  "Insert an empty line below the current line."
  (interactive)
  (save-excursion
(end-of-line)
(open-line 1)))

(defun hamza/insert-line-above ()
  "insert an empty line above the current line."
  (interactive)
  (save-excursion
(end-of-line 0)
(open-line 1)))

(defun hamza/remove-line-below ()
  "Remove the line below the current line."
  (interactive)
  (save-excursion
(next-line)
(kill-whole-line)))

(defun hamza/remove-line-above ()
  "Remove the line above the current line."
  (interactive)
  (save-excursion
(previous-line)
(kill-whole-line)))

(defun hamza/insert-and-goto-line-below ()
  "Insert a line below the current line and move to it"
  (interactive)
  (save-excursion
(end-of-line)
(open-line 1)))

(defun hamza/insert-and-goto-line-above ()
  "Insert a line above the current line and move to it"
  (interactive)
  (save-excursion
(end-of-line)
(open-line 1)))

(defun hamza/download-url (url path)
  "Downloads a file from a URL.
Argument PATH Where to save on your computer."
  (interactive "MPlease Enter URL: \nFPlease Enter the File to Save to: ")
  (url-copy-file url path))

;; Open Image in another program
(defun hamza/open-image-externally (x)
  "Takes an image and opens in GIMP or any other external program.
Argument X The image file path."
  (interactive "FPlease Enter an Image: ")
  ;;(start-process "" nil "xfce4-terminal"))
  (shell-command (concat "gimp " x)))

;; Helper for compilation. Close the compilation window if
;; there was no error at all. (emacs wiki)
(defun hamza/compilation-exit-autoclose (status code msg)
  "If <M-x> compile exists with a 0 then bury the *compilation* buffer, so that C-x b doesn't go there and delete the *compilation* window."
  (when (and (eq status 'exit) (zerop code))
(bury-buffer)
(delete-window (get-buffer-window (get-buffer "*compilation*"))))
  ;; Always return the anticipated result of compilation-exit-message-function
  (cons msg code))

;; Specify my function (maybe I should have done a lambda function)
(setq compilation-exit-message-function 'hamza/compilation-exit-autoclose)

(defun hamza/align-comments-// (beginning end)
  "Align instances of // within marked region."
  (interactive "*r")
  (let (indent-tabs-mode align-to-tab-stop)
(align-regexp beginning end "\\(\\s-*\\)//")))

(defun hamza/align-comments-\;\; (beginning end)
  "Align instances of // within marked region."
  (interactive "*r")
  (let (indent-tabs-mode align-to-tab-stop)
(align-regexp beginning end "\\(\\s-*\\);;")))

(defun hamza/align-comments-// (beginning end)
  "Align instances of // within marked region."
  (interactive "*r")
  (let (indent-tabs-mode align-to-tab-stop)
(align-regexp beginning end "\\(\\s-*\\)//")))

(defun hamza/olivetti-resize (size)
  (interactive "NPlease Enter the width: ")
  (setq olivetti-body-width size)
  (setq fill-column size))

(defun hamza/default-olivetti-resize ()
  (interactive)
  (setq olivetti-body-width 90)
  (setq fill-column 80))

;; (defun hamza/get-auto-fill-paragraph ()
;;   ;; (move-beginning-of-line)
;;   ;; (move-end-of-line)
;;   ;; (forward-char)
;;   ;; (move-beginning-of-line)
;;   ;; (line-number-at-pos)
;;   ;; (current-column)
;;   ;; (while (> (point) (end-of-line)

;;   (interactive)

;;   ;; How many chars in a line
;;   (setq original-pos (point))
;;   (move-end-of-line 1)
;;   (setq chars-in-line (- (current-column) 1))

;;   ;(setq lines-in-buffer)
;;   ;;(when (  ))
;;   (if (>= chars-in-line fill-column)
;; 	  (progn
;; 		(fill-paragraph)
;; 		(forward-line 1)))
;;   (goto-char original-pos))

(defun hamza/flyspell-save-word (bool)
  (interactive (list (y-or-n-p (concat "Do you want to save the current word, \"" (word-at-point) "\""))))
  (if bool
  (let ((current-location (point))
	 (word (flyspell-get-word)))
(when (consp word)
  (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location)))))

;; (defun hamza/do-the-thing? (bool)
;;   (setq ungabunga "mission assasinate")
;;
;;   ;;(y-or-n-p (concat "Do you want to do it?" ungabunga))))
;;   ;;(interactive (list (read-string "dope right? ")
;;   ;;  				   (y-or-n-p "Do you want to do it?")))
;;
;;   (interactive (list (y-or-n-p (concat "Do you want to do it? \"" (word-at-point) "\""))))
;;
;;   (if bool (message "Here is your ungabunga: %s" ungabunga)))
;;

;; Useless automatically indents

;; (defun hamza/emmet-tab ()
;;   (interactive)
;;   (if (looking-at "\\_>")
;;       (emmet-expand-line nil)
;;     (indent-according-to-mode)))

(defun hamza/reload-config ()
  (interactive)
  (setq my-org-config-file (concat user-emacs-directory "init.org"))
  (setq my-config-file (concat user-emacs-directory "org-init.el"))
  (org-babel-tangle-file my-org-config-file)
  (load-file my-config-file))

(defun hamza/clear-the-clutter ()
  (interactive)
  ;; (message "%s"
  ;;   (mapcar 'buffer-name
  ;;     (buffer-list)))
  (mapc (lambda (buffer)
		  (let ((buf-name (buffer-name buffer)))
			(unless (or (string= buf-name "*scratch*")
						(string= buf-name "*Messages*"))
			  (kill-buffer buffer))))
		(buffer-list)))

(global-set-key (kbd "M-j") 'hamza/insert-line-below)
(global-set-key (kbd "M-k") 'hamza/insert-line-above)
(global-set-key (kbd "M-C-j") 'hamza/remove-line-below)
(global-set-key (kbd "M-C-k") 'hamza/remove-line-above)

;; Will make it a lot less annoying to use Evil in the minibuffer and in M-x
;; Removing "insert-digraph" and unbinding C-k in insert-mode
(eval-after-load "evil-maps"
  (define-key evil-insert-state-map "\C-k" nil))

(use-package general
  :config
  (general-define-key
   :states '(normal visual insert emacs)
   :keymaps 'override ;; override any existing keybindings
   :prefix "SPC"
   :non-normal-prefix "M-SPC"

   ;;; General ;)
   "SPC" '(vterm-find-file :which-key "Find File")
   "s" '(save-buffer :which-key "Save Buffer")

   ;;; Files
   "f" '(:ignore t :which-key "Files")
   "ff" '(find-file :which-key "Find File")
   "ft" '((lambda () (interactive)(find-file "~/wrk/todo.org")) :which-key "Todo")
   ;; Dev
   "fd" '(:ignore t :which-key "Development")
   "fdd" '((lambda () (interactive)(find-file "~/dev")) :which-key "Development")
   "fdj" '((lambda () (interactive)(find-file "~/dev/java")) :which-key "Java")
   "fdc" '((lambda () (interactive)(find-file "~/dev/cpp")) :which-key "C++")
   "fdh" '((lambda () (interactive)(find-file "~/dev/haskell")) :which-key "Haskell")
   ;; Dev/Learning
   "fdl" '(:ignore t :which-key "Learning")
   "fdld" '((lambda () (interactive)(find-file "~/dev/learning")) :which-key "Learning")
   "fdlj" '((lambda () (interactive)(find-file "~/dev/learning/java")) :which-key "Java")
   "fdlc" '((lambda () (interactive)(find-file "~/dev/learning/cpp")) :which-key "C++")
   "fdlh" '((lambda () (interactive)(find-file "~/dev/learning/haskell")) :which-key "Haskell")
   ;; Education
   "fe" '(:ignore t :which-key "Education")
   "fec" '(:ignore t :which-key "Computer Science")
   "fecn" '((lambda () (interactive)(find-file "~/edu/o-lvls/comp/notes/notes.org")) :which-key "Notes")
   "fecp" '((lambda () (interactive)(find-file "~/edu/o-lvls/comp/pp/")) :which-key "Past Papers")
   "fep" '(:ignore t :which-key "Physics")
   "fepn" '((lambda () (interactive)(find-file "~/edu/o-lvls/phys/notes/notes.org")) :which-key "Notes")
   "fepk" '((lambda () (interactive)(find-file "~/edu/o-lvls/phys/notes/khanacademy-notes.org")) :which-key "Khan Academy Notes")
   "fepp" '((lambda () (interactive)(find-file "~/edu/o-lvls/phys/pp/")) :which-key "Past Papers")
   "fem" '(:ignore t :which-key "Maths")
   "femn" '((lambda () (interactive)(find-file "~/edu/o-lvls/math/notes/notes.org")) :which-key "Notes")
   "femp" '((lambda () (interactive)(find-file "~/edu/o-lvls/math/pp/")) :which-key "Past Papers")
   "fei" '(:ignore t :which-key "Islamiyat")
   "fein" '((lambda () (interactive)(find-file "~/edu/o-lvls/isl/notes/notes.org")) :which-key "Islamiyat")
   "feip" '((lambda () (interactive)(find-file "~/edu/o-lvls/isl/pp/")) :which-key "Past Papers")
   ;; Config Files
   "fc" '(:ignore t :which-key "Configuration Files")
   "fce" '((lambda () (interactive)(find-file "~/.emacs.d/init.org")) :which-key "Emacs config")
   "fcw" '(:ignore t :which-key "WM Config Files")
   "fcwa" '((lambda () (interactive)(find-file "~/.config/awesome/rc.lua")) :which-key "AwesomeWM Config")
   "fcwx" '((lambda () (interactive)(find-file "~/.xmonad/xmonad.hs")) :which-key "XMonad Config")
   "fcws" '((lambda () (interactive)(find-file "~/.stumpwm.d/init.lisp")) :which-key "StumpWM Config")

   ;;; Code
   "c" '(:ignore t :which-key "Code")
   "cc" '(compile :which-key "Compile")
   "ce" '(eshell-command :which-key "Run a Command in Eshell")
   "cs" '(eval-last-sexp :which-key "Run Elisp Code before Point")

   ;;; Applications
   "a" '(:ignore t :which-key "Applications")
   "ad" '(dired :which-key "Dired")
   "ae" '(eshell :which-key "Eshell")
   "ar" '(ranger :which-key "Ranger")
   "av" '(vterm :which-key "Vterm")

   ;;; Buffers
   "b" '(:ignore t :which-key "Buffers")
   "bb" '(switch-to-buffer :which-key "Switch to Buffer")
   "bB" '(ibuffer :which-key "ibuffer")
   "bk" '(kill-current-buffer :which-key "Kill Buffer")
   "br" '(revert-buffer :which-key "Revert Buffer")

   ;;; Toggle
   "t" '(:ignore t :which-key "Toggle")
   "tf" '(flyspell-mode :which-key "Flyspell")
   "tt" '(treemacs :which-key "Treemacs")
   "tc" '(centaur-tabs-local-mode :which-key "Centaur Tabs")
   "tl" '(global-display-line-numbers-mode :which-key "Line Numbers")
   "tg" '(evil-goggles-mode :which-key "Evil Goggles")
   "ts" '(:ignore t :which-key "Smartparens")
   "tst" '(smartparens-mode :which-key "Smartparens Mode")
   "tss" '(smartparens-strict-mode :which-key "Strict Mode")

   ;;; Org Mode
   "o" '(:ignore t :which-key "Org")
   "oj" '(org-insert-subheading :which-key "Insert Subheading")
   "oJ" '(org-insert-heading :which-key "Insert Heading")
   "ow" '(org-todo :which-key "Org Todo") ;; w for work... I don't know man.
   ;; Headings
   "oh" '(:ignore t :which-key "Headings")
   "ohs" '(:ignore t :which-key "Subheading")
   "ohst" '(org-insert-todo-subheading :which-key "Todo Subheading")
   ;; Links
   "ol" '(:ignore t :which-key "Link")
   "olf" '(org-open-at-point :which-key "Follow Link")
   "ols" '(org-store-link :which-key "Store Link")
   ;; Code / Babel
   "oc" '(:ignore t :which-key "Code")
   "ocr" '(hamza/reload-config :which-key "Reload Config")
   "occ" '(org-babel-execute-src-block :which-key "Compile")
   "ocl" '((lambda() (interactive) (org-babel-execute-src-block) (org-redisplay-inline-images)) :which-key "Latex Compile")
   ;; Org Roam
   "or" '(:ignore t :which-key "Org Roam")
   "ori" '(org-roam-insert :which-key "Insert")
   "orf" '(org-roam-find-file :which-key "Find File")
   "org" '(org-roam-graph :which-key "Display Graph")
   "orc" '(org-roam-capture :which-key "Org Capture")
   ;; Org Tex
   "ot" '(:ignore t :which-key "TeX/LaTeX")
   "otp" '(org-latex-preview :which-key "LaTeX Preview")
   "otb" '(org-beamer-export-to-pdf :which-key "Export Beamer to PDF")
   "otc" '(org-latex-export-to-pdf :which-key "Export LaTeX to PDF")))

   ;;; TeX
   ;"t" '(:ignore t :which-key "TeX/LaTeX")
