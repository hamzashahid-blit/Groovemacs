;;; init.el --- Hamza Shahid's Emacs Config
;;; Code:

(setq-default
 inhibit-startup-message t                           ; Will not show up Emacs logo and splash on screen
 visible-bell t                                      ; Will flash the screen on error/invalid operation
 fill-column 100                                     ; toggle wrapping text at the 80th character
 tab-width 4                                         ; Set width for tabs
 delete-by-moving-to-trash t                         ; Delete files to trash
 backup-directory-alist `(("." . "~/.saves"))
 initial-scratch-message ";; Welcome to Emacs!\n\n") ; print a default message in the empty scratch buffer opened at startup

(setq doom-modeline-icon t)           ; Icons in doom modeline are turned off by design when run from daemon
      ;doom-modeline-height 27)

(tool-bar-mode -1)                                ; Remove toolbar on top
(menu-bar-mode -1)                                ; Remove menubar below toolbar
(tooltip-mode -1)                                 ; Remove tooltip (help on hover)
(scroll-bar-mode -1)                              ; Remove scrollbar
(set-fringe-mode 10)                              ; Give some breathing room
(fset 'yes-or-no-p 'y-or-n-p)                     ; Replace yes/no prompts with y/n
(global-subword-mode 1)                           ; Iterate through CamelCase words


;; Make ESC quit prompts
;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Set font and font size

;; Default font size
(set-face-attribute 'default nil :font "Mononoki" :height 150) ;; :height 118

;; Modeline font size
;; (set-face-attribute 'mode-line nil :font "Mononoki-12" :height 140)
;; (set-face-attribute 'mode-line-buffer-id nil :font "Mononoki-12" :height 150)
;; (set-face-attribute 'mode-line-emphasis nil :font "Mononoki-12" :height 150)
;; (set-face-attribute 'mode-line-highlight nil :font "Mononoki-12" :height 150)
;; (set-face-attribute 'mode-line-inactive nil :font "Mononoki-12" :height 150)

;; (set-face-attribute 'mode-line nil :font "Mononoki")
;; (set-face-attribute 'mode-line-buffer-id nil :font "Mononoki")
;; (set-face-attribute 'mode-line-emphasis nil :font "Mononoki")
;; (set-face-attribute 'mode-line-highlight nil :font "Mononoki")
;; (set-face-attribute 'mode-line-inactive nil :font "Mononoki")

;; Before the above was Monospace-12, then Mononoki-15

(set-default-coding-systems 'utf-8)     ; Default to utf-8 encoding
(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;(let ((faces '(mode-line
;              mode-line-buffer-id
;              mode-line-emphasis
;              mode-line-highlight
;              mode-line-inactive)))
;    (mapc
;     (lambda (face) (set-face-attribute face nil :font "Monospace-10"))
;     faces))

;; Indenting Behaviour
(put 'add-function 'lisp-indent-function 2)
(put 'advice-add 'lisp-indent-function 2)
(put 'evil-define-key* 'lisp-indent-function 'defun)
(put 'plist-put 'lisp-indent-function 2)

;; Garbage-collect on focus-out, Emacs should feel snappier overall.
;; but messes with (use-package smooth-scrolling)
 (add-function :after after-focus-change-function
   (defun me/garbage-collect-maybe ()
     (unless (frame-focus-state)
       (garbage-collect))))


;; *** Initialize package sources ***

(add-to-list 'load-path "~/.emacs.d")

(require 'package)                   ; Bring in to the environment all package management functions

;; A list of package repositories
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")
                         ("elpa"  . "https://elpa.gnu.org/packages/")))

(package-initialize)                 ; Initializes the package system and prepares it to be used

(unless package-archive-contents     ; Unless a package archive already exists,
  (package-refresh-contents))        ; Refresh package contents so that Emacs knows which packages to load


;; Initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)        ; Unless "use-package" is installed, install "use-package"
  (package-install 'use-package))

(require 'use-package)                            ; Once it's installed, we load it using require

;; Make sure packages are downloaded and installed before they are run
;; also frees you from having to put :ensure t after installing EVERY PACKAGE.
(setq use-package-always-ensure t)

(use-package cl-libify
  :config
  (require 'cl-lib))

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

(use-package hl-line
  :config
  (global-hl-line-mode 1))
; (set-face-attribute 'hl-line nil :background "gray21"))


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


;;; START TABS CONFIG

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
;; (use-package smart-tabs-mode
;;   :config
;;   (setq evil-indent-convert-tabs nil))

;;; END TABS CONFIG



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

(use-package ranger
  :defer t)

(use-package pcre2el
  :config 
  (pcre-mode 0))

;; Make life easier
(use-package helm
  :diminish           ;Removes Helm showing up in modeline
  :init
    (require 'helm-config)                       ; Load helm's config
    (setq helm-move-to-line-cycle-in-source t    ; Cycle to the top when you go past the bottom and vice versa;
	  helm-split-window-in-side-p t)
  :config
;    (helm-mode 1) ;; Most of Emacs prompts become helm-enabled
    (helm-autoresize-mode 1) ;; Helm resizes according to the number of candidates
;    (global-set-key (kbd "C-x b") 'helm-buffers-list) ;; List buffers ( Emacs way )
    ;(define-key evil-ex-map "b" 'helm-buffers-list) ;; List buffers ( Vim way )
    (global-set-key (kbd "C-x r b") 'helm-bookmarks) ;; Bookmarks menu
    (global-set-key (kbd "C-x C-f") 'helm-find-files) ;; Finding files with Helm
    (global-set-key (kbd "M-c") 'helm-calcul-expression) ;; Use Helm for calculations
    (global-set-key (kbd "C-s") 'helm-occur) ;; Replaces the default isearch keybinding
    (global-set-key (kbd "C-h a") 'helm-apropos)  ;; Helmized apropos interface
    (global-set-key (kbd "M-X") 'helm-M-x)  ;; Improved M-x menu
    (global-set-key (kbd "M-y") 'helm-show-kill-ring))  ;; Show kill ring, pick something to paste

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1)
 '(ivy-initial-inputs-alist nil)
  (setq ivy-re-builders-alist
      '((ivy-switch-buffer . ivy--regex-plus)
		(swiper . ivy--regex-plus)
        (t . ivy--regex-plus)))) ;; you could use ivy--regex-fuzzy for ULTIMATE Matching but it is
                                 ;; too much for me

(use-package helm-dash)
(use-package dash)

(use-package doom-modeline
  :init (doom-modeline-mode 1))

;; (use-package telephone-line
;;   :init
;;     (setq telephone-line-lhs
;;         '((evil   . (telephone-line-evil-tag-segment))
;;             (accent . (telephone-line-vc-segment
;;                     telephone-line-erc-modified-channels-segment
;;                     telephone-line-process-segment))
;;             (nil    . (telephone-line-minor-mode-segment
;;                     telephone-line-buffer-segment))))
;;     (setq telephone-line-rhs
;;         '((nil    . (telephone-line-misc-info-segment))
;;             (accent . (telephone-line-major-mode-segment))
;;             (evil   . (telephone-line-airline-position-segment))))
;;     (telephone-line-mode 1))

(use-package doom-themes
  :init (load-theme 'doom-gruvbox t))

;; Fuzzy Sort Ivy
(use-package flx)

;; Sorts latest commands (faster than smex) to the top
(use-package ivy-prescient
  :config
  (ivy-prescient-mode 1))

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
  :bind (("M-<tab>" . nswbuff-switch-to-next-buffer)
         ("M-<iso-lefttab>" . nswbuff-switch-to-previous-buffer)))

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

(use-package org
  :config
  (setq org-confirm-babel-evaluate nil)
  (setq org-ellipsis " ↴")
  (setq org-agenda-files
		'("~/wrk/tasks.org"))

  (add-hook 'org-mode-hook 'turn-on-flyspell)
  (add-hook 'org-mode-hook 'turn-on-auto-fill) 

  (setq org-agenda-start-with-log-mode t) ;; present a log
  (setq org-log-done 'note)
  (setq org-log-into-drawer t)) ;; show time when things are done ('time) or ask for a note ('note)

(use-package projectile
  :defer t)

;;; UI Tweaks

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


;; Rainbow delimiters (and/or parenthesis)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

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
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3)) ; delay before popping up the which-key panel

;; (use-package which-key-posframe)

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)))

(use-package helpful
  :defer t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))


;; jump around very conveniently
(use-package avy)

;; (use-package xah-fly-keys
;;   :init
;;   (xah-fly-keys-set-layout "qwerty"))

(use-package boon
  :config
  (require 'boon-qwerty))

(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev))
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . meow-motion-origin-command)
   '("k" . meow-motion-origin-command)
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("C" . meow-change-save)
   '("d" . meow-C-d)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("F" . meow-find-expand)
   '("g" . meow-cancel)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("N" . meow-pop-search)
   '("o" . meow-block)
   '("O" . meow-block-expand)
   '("p" . meow-yank)
   '("P" . meow-yank-pop)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("T" . meow-till-expand)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("V" . meow-kmacro-matches)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-kmacro-lines)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("Z" . meow-pop-all-selection)
   '("&" . meow-query-replace)
   '("%" . meow-query-replace-regexp)
   '("'" . repeat)
   '("\\" . quoted-insert)
   '("<escape>" . meow-last-buffer)))

(use-package meow
  :demand t
  :init
  (meow-global-mode 0)
  :config
  (meow-setup)
  (meow-setup-line-number)
  (meow-setup-indicator))

;;;;;;;;;;;;;;;;;
;;; EVIL MODE ;;;
;;;;;;;;;;;;;;;;;

; (setq evil-want-keybinding nil) ; Adds more vim bindings to other parts of emacs. I use evil-collection instead

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil) ; Adds more vim bindings to other parts of emacs. I use evil-collection instead
  (setq evil-want-C-u-scroll t) ; Use C-u as go up instead of universal argument
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

  ;; (define-key evil-normal-state-map (kbd "C-l o") 'org-open-at-point)
  ;; (define-key evil-normal-state-map (kbd "C-l b") 'org-mark-ring-goto)
  ;; (define-key evil-normal-state-map (kbd "C-l i") 'org-insert-link)
  ;; (define-key evil-normal-state-map (kbd "C-l s") 'org-store-link)

  (define-key evil-normal-state-map (kbd "J") 'pixel-scroll-up)
  (define-key evil-normal-state-map (kbd "K") 'pixel-scroll-down)

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
  (evil-mc-mode t))

(use-package ivy-posframe)

;; Pops up a window and allows you to view registers and marks before using them.
(use-package evil-owl
  :config
  (setq evil-owl-display-method 'posframe
        evil-owl-extra-posframe-args '(:width 50 :height 20)
        evil-owl-max-string-length 50)

  (defun mpereira/update-evil-owl-posframe-args ()
      (interactive)
      (setq evil-owl-extra-posframe-args
          `(:width 80
              :height 20
              :background-color ,(face-attribute 'ivy-posframe :background nil t)
              :foreground-color ,(face-attribute 'ivy-posframe :foreground nil t)
              :internal-border-width ,ivy-posframe-border-width
              :internal-border-color ,(face-attribute 'ivy-posframe-border
                                                      :background
                                                      nil
                                                      t))))

  ;; This needs to run after the initial theme load.
  (add-hook 'after-init-hook 'mpereira/update-evil-owl-posframe-args 'append)
  (add-hook 'after-load-theme-hook 'mpereira/update-evil-owl-posframe-args)

  (evil-owl-mode))

;; comment without selecting and more effecient, does not need evil
(use-package evil-nerd-commenter
  :after evil)

;; Hit % and basically EVERY language will jump between tags
(use-package evil-matchit
  :after evil
  :config
  (global-evil-matchit-mode 1))



;; Cursors start
(use-package multiple-cursors)
(use-package visual-regexp-steroids
  :config
  (define-key global-map (kbd "C-c r") 'vr/replace)
  (define-key global-map (kbd "C-c q") 'vr/query-replace)

  ;; to use visual-regexp-steroids's isearch instead of the built-in regexp isearch
  ;(define-key esc-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s
  ;(define-key esc-map (kbd "C-r") 'vr/isearch-backward)) ;; C-M-r

  ;; if you use multiple-cursors, this is for you:
  (define-key global-map (kbd "C-c m") 'vr/mc-mark))
;; Cursors end

;; (use-package evil-multiedit
;;   :config
;;   (evil-multiedit-default-keybinds))

(use-package evil-multiedit
  :after evil
  :config
  (setq evil-multiedit-follow-matches t))

(use-package anzu)

;; be in a state like when you press C-x C-+ and then just press +, - or 0
(use-package hydra
  :defer t)

;;; Terminal Start ;;;

(use-package term
  :config
  (setq explicit-shell-file-name "bash")
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))

;; 256 terminal colors yayyyy
(use-package eterm-256color
  :config
  (add-hook 'term-mode-hook 'eterm-256color-mode))

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
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")
  ;;(setq vterm-shell "zsh")
  (setq vterm-max-scrollback 10000))

;(advice-add :before #'find-file #'vterm-directory-sync)

(defun vterm-find-file ()
  "Start vterm-directory-sync before find-file"
  (interactive)
  (vterm-directory-sync)
  (counsel-find-file))

;;; Terminal End ;;;

;;; TeX Start ;;;

;; Add ConTeXt to my Emacs Path so that eshell, term etc. could use them
(add-to-list 'exec-path "/home/hamza/.src/context-linux/tex/texmf-linux/bin")

(use-package pdf-tools
  :defer t)

(use-package auctex
  :defer t
  :ensure auctex
  :config
  (setq TeX-PDF-mode t))

(use-package auctex-latexmk
  :defer t)

;;; TeX End ;;;

;;; PROGRAMMING ;;;


(use-package auto-complete
  :diminish
  :init
  (require 'auto-complete-config)
  :config
  (ac-config-default))

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

;;; DEVELOPMENT START ;;;

;; LSP

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


;; Haskell START ;;


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

;; Haskell END ;;

(use-package slime
  :config
  (setq inferior-lisp-program "ccl"))

(use-package cmake-mode
  :defer t)
(use-package lua-mode
  :defer t)
(use-package nix-mode
  :defer t)
(use-package nim-mode
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

(use-package j-mode
  :defer t
  :init
  (setq j-console-cmd "jconsole"))

;; C++ START ;;

;;; DOESN'T WORK AUTOMATICALLY or does it?


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

;; C++ END ;;


;; Web Development ;;

(use-package web-mode
  ;; :defer t ;; Makes it not work
  ;; File formats
  :mode (("\\.html?\\'" . web-mode)
         ("\\.phtml\\'" . web-mode)
         ("\\.djhtml\\'" . web-mode)
         ("\\.css?\\'" . web-mode)
         ("\\.js\\'" . web-mode)
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
  ;; (add-hook 'js-mode-hook'web-mode)
  ;; (add-hook 'sgml-mode-hook 'web-mode)

  ;; Indentation
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-attr-indent-offset 4)

  ;; Features
  (setq web-mode-enable-auto-pairing 1)
  ;; (setq web-mode-enable-css-colorization 1)
  ;; (setq web-mode-enable-current-element-highlight 1)
  (setq web-mode-enable-auto-closing 1)

  ;; Auto-complete
  (setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev)))))

(use-package emmet-mode
  ;; :defer t ;; Makes it not work
  ;; useless automatically works
  ;; :bind (("<C-return>" . hamza/emmet-tab)
  ;;        ("C-j" . emmet-expand-line))
  :config
  (add-hook 'web-mode-hook 'emmet-mode))

(use-package js2-mode
  :defer t)

;; Web Development ;;

;;; Programming End ;;;



;;; Image Related Stuff Start ;;;

(use-package eimp
  :defer t)

;;; Image Related Stuff End ;;;

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
;;   (eaf-bind-key nil "M-q" eaf-browser-keybinding)) ;; unbind, see more in the Wiki

;;; Org Mode Start ;;;

;; 'org-store-link allows to create a link to any header in any org mode file.
;; and if you run 'org-insert-link right after that, you can insert a link to goto that heading
;; for now, to go to the link you have to click the link
;(global-set-key (kbd "C-c l") 'org-store-link)
;(global-set-key (kbd "C-c C-l") 'org-insert-link)

;; (use-package org-bullets
;;   :config
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-superstar
  :hook (org-mode . org-superstar-mode))
  ;; :config
  ;; (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(setq org-image-actual-width nil)
(setq org-hide-emphasis-markers t)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

(use-package olivetti
  :hook (org-mode . olivetti-mode)
  :init
  (setq olivetti-body-width 90)
  (setq fill-column 80))

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

(use-package org-download)

;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)

;;; DIRED start ;;;

(use-package all-the-icons-dired
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))
;(use-package treemacs-icons-dired
  ;:after treemacs dired
  ;:config
  ;(treemacs-icons-dired-mode))
;(use-package treemacs-all-the-icons)

;(setq dired-listting-switches )

;;; DIRED end ;;;

;; Babel Start

(org-babel-do-load-languages 'org-babel-load-languages
  '(
    (shell . t)
	(latex . t)
  )
)

;; Babel End

;;; Org Mode End ;;;




;;; Custom Functions Start ;;;

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


;;; Custom Functions End ;;;



;;; Keybindings

(global-set-key (kbd "M-j") 'hamza/insert-line-below)
(global-set-key (kbd "M-k") 'hamza/insert-line-above)
(global-set-key (kbd "M-C-j") 'hamza/remove-line-below)
(global-set-key (kbd "M-C-k") 'hamza/remove-line-above)

(use-package general
  :config
  ;; (general-define-key
  ;;  :states '(normal visual)
  ;;  :keymaps 'override ;; override any existing keybindings

  ;;  ""

  (general-define-key
   :states '(normal visual insert emacs)
   :keymaps 'override ;; override any existing keybindings
   :prefix "SPC"
   :non-normal-prefix "C-SPC"

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
   "fce" '((lambda () (interactive)(find-file "~/.emacs.d/init.el")) :which-key "Emacs config")
   "fcw" '(:ignore t :which-key "WM Config Files")
   "fcwa" '((lambda () (interactive)(find-file "~/.config/awesome/rc.lua")) :which-key "AwesomeWM Config")
   "fcwx" '((lambda () (interactive)(find-file "~/.xmonad/xmonad.hs")) :which-key "XMonad Config")

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
   "tl" '(global-display-line-numbers-mode :which-key "Line Numbers")
   "tg" '(evil-goggles-mode :which-key "Evil Goggles")
   "ts" '(:ignore t :which-key "Smartparens")
   "tst" '(smartparens-mode :which-key "Toggle Smartparens Mode")
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
    '(j-mode gnu-apl-mode slime boon xah-fly-keys pcre2el which-key which-key-posframe js2-mode web-mode emmet-mode cmake-mode evil-mu4e vterm fold-this yafolding ivy-posframe evil-owl evil-org evil-matchit evil-nerd-commenter evil-goggles evil-exchange evil-lion good-scroll anzu evil-multiedit evil-mc multiple-cursors visual-regexp-steroids eterm-256color treemacs-icons-dired all-the-icons-dired dired-icons evil-surround org-drill ivy-prescient smart-tabs-mode highlight-indent-guides flx-counsel flx hindent dap-haskell dap-mode lsp-treemacs lsp-ivy lsp-ui lsp-haskell yasnippet-snippets use-package undo-tree try sublimity smooth-scrolling restart-emacs ranger rainbow-delimiters quelpa projectile pdf-tools org-superstar org-roam org-noter org-download olivetti magit lua-mode ivy-rich iedit hydra helpful helm-dash haskell-mode general evil-smartparens evil-collection eimp doom-themes doom-modeline counsel concurrent command-log-mode cl-libify auto-complete auctex-latexmk))
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
