;;; meow-tutorial.el --- Tutorial in Meow -*- lexical-binding: t -*-

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.


;;; Commentary:
;; A tutorial in Meow.

;;; Code:

(defconst meow-tutorial-page-1
  "
  Welcome to Meow, A modal editing in Emacs.

  In this tutorial we will walk through the basic concepts, modes and commands.
Before we start, I recommend you save your works.

  About 10 minutes is required to finish the tutorial, and don't be panic, you can quit at any time.

[start]
")

(defconst meow-tutorial-page-2
  "[quit]

  Meow is activated and we are in NORMAL mode!

  You may notice almost every single keys have no bounded command. This is because Meow has no opinion for command layout. We have to build our own layout. We use `meow-normal-define-key' to bind command for NORMAL mode.

  At the moment, we can still use vanilla Emacs command to move around and execute commands. But we need a way to ENTER INSERT mode, so we can type. Evaluate the following expression with C-x C-e or C-M-x.

(meow-normal-define-key
  '(\"i\" . meow-insert)
  '(\"I\" . meow-open-above)
  '(\"a\" . meow-append)
  '(\"A\" . meow-open-below))

  Now, we can enter INSERT mode with i, a, I or A.

(You don't have to copy these codes to configuration, the decision you made will be collected at the end of this tutorial.)

[next]")

(defconst meow-tutorial-page-3
  "[quit]

  I guess you are eager to have basic movement keybindings.

(meow-normal-define-key
  '(\"h\" . meow-left)
  '(\"H\" . meow-left-expand)
  '(\"j\" . meow-next)
  '(\"J\" . meow-next-expand)
  '(\"k\" . meow-prev)
  '(\"K\" . meow-prev-expand)
  '(\"l\" . meow-right)
  '(\"L\" . meow-right-expand))

  (You may want to tweak a little bit if you are not on Qwerty keyboard layout.)

  Now we have basic 4 direction movements, those with upper cases will expand selection(or called region). In Meow, selection has a type and it is one part of the core concept in Meow.

  A selection type can be described as (expand/select . THING). For example, `meow-next-expand' will start a selection, and its type is described as (expand . char). You can check with M-: (meow--selection-type). The expand means the selection can be extended with commands those have a same THING property. So the selection started with `meow-next-expand' can be expanded by all these charactor movements.

Try with `meow-right-expand', `meow-right', `meow-right', `meow-right', ...

[prev][next]")

(defconst meow-tutorial-page-4
  "[quit]

  Motion and selection are usually combined together.

  Let's introduce some commands for word and symbols.

(meow-normal-define-key
  '(\"b\" . meow-back-word)
  '(\"B\" . meow-back-symbol)
  '(\"e\" . meow-next-word)
  '(\"E\" . meow-next-symbol)
  '(\"w\" . meow-mark-word)
  '(\"W\" . meow-mark-symbol))

  Things are getting interesting, because these commands are not those we familiar in Vim. `meow-back-*' and `meow-next-*' will make a selection of type (select . word). The select means the selection will not be expanded when you give it a command with same THING. so these command will not expand for each other or themselves.

  But `meow-mark-*' command will create a selection with type (expand . word). So it can be your start point if you want select a few words or symbols. You may notice some overlay hints show you the count of occurs for what you select with `meow-mark-*'. We will explain how it works in next page.

[prev][next]")

(defconst meow-tutorial-page-5
  "[quit]

  In these page, we talk about searching. Binding the following commands according to your preferences.

(meow-normal-define-key
  '(\"v\" . meow-visit)
  '(\"n\" . meow-search)
  '(\"N\" . meow-pop-search)
  '(\";\" . meow-reverse))

  In Emacs, `regexp-search-ring' is used to store your searching histories. In Meow, there are 4 commands will commit a regexp into the ring, they are: `meow-mark-word', `meow-mark-symbol', `meow-visit' and `meow-search'.

  We already seen how `meow-mark-*' works, let's introduce `meow-visit'. You can use `meow-visit' for a quick symbol searching, a completion is provided to make things easier.

  To search continuously, we need to talk about `meow-search'. There are some rules to help understanding:
  1. `meow-search' will read the car of `regexp-search-ring', if current search is not match current selection, the content of current selection will be added into `regexp-search-ring'.
  2. `meow-search' will search according to the car of `regexp-search-ring'.
  3. The search direction of `meow-search' is controlled by the direction of selection.

  How to change this direction? use `meow-reverse'.
  How to pop current selection history? use `meow-pop-search'.

  Play a little bit and go on!

[prev][next]")

(defconst meow-tutorial-page-6
  "[quit]

  The frequently used, line selection!

(meow-normal-define-key
  '(\"x\" . meow-line)
  '(\"z\" . meow-pop))

  Okay, let's talk about the behavior of `meow-line'. It will create a selection from the beginning of line to the end of line(newline is excluded). And the selection type, (expand . line) means you can expand by just type it multiple times. Of course, `meow-line' respect the direction of selection.

  Since there's only one key to expand, how to shrink the selection? You need `meow-pop'. By each type, it will pop one selection, not matter what type it is.

  Have you notice the number hints will you use `meow-next-word/symbol', `meow-back-word/symbol' and `meow-line'. In next page, we will introduce `meow-expand'.

[prev][next]")

(defconst meow-tutorial-page-7
  "[quit]

  Expanding in a predictable, fault-tolerant way.

(meow-normal-define-key
  '(\"1\" . meow-expand)
  '(\"2\" . meow-expand)
  '(\"3\" . meow-expand)
  '(\"4\" . meow-expand)
  '(\"5\" . meow-expand)
  '(\"6\" . meow-expand)
  '(\"7\" . meow-expand)
  '(\"8\" . meow-expand)
  '(\"9\" . meow-expand)
  '(\"0\" . meow-expand))

  In vanilla Emacs or Vim, to forward 5 words, we use C-5 C-f and 5e. Counting 5 words is easy, but counting 15 words is hard.

  In Meow, we can expand the selection with `meow-expand', this command works by repeating movements with current selection type. So if we use `meow-line' + `meow-expand' to select multiple lines, use `meow-next-word' + `meow-expand' to select multiple words.

  NOTE 1: `meow-expand' will upgrade selection type to (expand . THING).

  NOTE 2: `meow-expand' is not `digit-argument', we will talk about this later.

[prev][next]
  ")

(defconst meow-tutorial-page-8
  "[quit]

  There are more motions in Meow.

(meow-normal-define-key
  '(\"o\" . meow-block)
  '(\"O\" . meow-block-expand)
  '(\"m\" . meow-join)
  '(\"f\" . meow-find)
  '(\"F\" . meow-find-expand)
  '(\"t\" . meow-till)
  '(\"T\" . meow-till-expand)
  '(\",\" . meow-inner-of-thing)
  '(\".\" . meow-bounds-of-thing)
  '(\"[\" . meow-beginning-of-thing)
  '(\"]\" . meow-end-of-thing))

  These commands are easy to understand and use. Some tips:
  - we use `meow-block' to escape parens.
  - we use `meow-block' to select S-expression quickly.
  - we use `meow-join' to jump to the indentation position.

  Now we have seen all the motions in Meow.
[prev][next]
")

(defconst meow-tutorial-page-9
  "[quit]

(meow-normal-define-key
  '(\"u\" . meow-undo)
  '(\"U\" . meow-undo-in-selection)
  '(\"p\" . meow-yank)
  '(\"p\" . meow-yank-pop)
  '(\"s\" . meow-kill)
  '(\"S\" . meow-kill-append)
  '(\"y\" . meow-save)
  '(\"Y\" . meow-save-append)
  '(\"r\" . meow-replace)
  '(\"R\" . meow-replace-save))

  You may have confusions here, let me explain.

  `meow-undo' is similar to `undo', but will always cancel the selection first. So with `meow-undo', we don't have to care about whether we have a selection or note. If we want to undo in selection, use `meow-undo-in-selection'.

  `meow-kill-append' and `meow-save-append' will append to current kill instead of inserting a new one to kill-ring.

  `meow-replace' will replace current selection with current kill, and `meow-replace-save' will exchange them.

[prev][next]")

;;; meow-tutorial.el ends here
