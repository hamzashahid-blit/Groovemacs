;;; meow-cheatsheet-layout.el --- Cheatsheet layouts for Meow  -*- lexical-binding: t; -*-

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
;; Cheatsheet layouts for Meow.

;;; Code:

(defconst meow-cheatsheet-physical-layout-ansi
  "
┏━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━━━━━┓
┃  <TLDE> │  <AE01> │  <AE02> │  <AE03> │  <AE04> │  <AE05> │  <AE06> │  <AE07> │  <AE08> │  <AE09> │  <AE10> │  <AE11> │  <AE12> │        BKSP ┃
┃         |         |         |         |         |         |         |         |         |         |         |         |         |             ┃
┠─┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┤             ┃
┃         │         │         │         │         │         │         │         │         │         │         │         │         │             ┃
┃         |         |         |         |         |         |         |         |         |         |         |         |         |             ┃
┠─────────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────────┨
┃        TAB  │  <AD01> │  <AD02> │  <AD03> │  <AD04> │  <AD05> │  <AD06> │  <AD07> │  <AD08> │  <AD09> │  <AD10> │  <AD11> │  <AD12> │  <BKSL> ┃
┃             |         |         |         |         |         |         |         |         |         |         |         |         |         ┃
┃             ├┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┨
┃             │         │         │         │         │         │         │         │         │         │         │         │         │         ┃
┃             |         |         |         |         |         |         |         |         |         |         |         |         |         ┃
┠─────────────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─────────┨
┃               │  <AC01> │  <AC02> │  <AC03> │  <AC04> │  <AC05> │  <AC06> │  <AC07> │  <AC08> │  <AC09> │  <AC10> │  <AC11> │             RET ┃
┃               |         |         |         |         |         |         |         |         |         |         |         │                 ┃
┃               ├┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┤                 ┃
┃               │         │         │         │         │         │         │         │         │         │         │         │                 ┃
┃               |         |         |         |         |         |         |         |         |         |         |         |                 ┃
┠───────────────┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────────────────┨
┃                     │  <AB01> │  <AB02> │  <AB03> │  <AB04> │  <AB05> │  <AB06> │  <AB07> │  <AB08> │  <AB09> │  <AB10> │                     ┃
┃                     |         |         |         |         |         |         |         |         |         |         |                     ┃
┃                     ├┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┤                     ┃
┃                     │         │         │         │         │         │         │         │         │         │         │                     ┃
┃                     |         |         |         |         |         |         |         |         |         |         |                     ┃
┗━━━━━━━━━━━━━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━╅─────────┴─────────┴─────────┴─────────╆━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━━━━━━━━━━━━━┛
                                                    ┃                                   SPC ┃
                                                    ┃                                       ┃
                                                    ┃                                       ┃
                                                    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
")

(defconst meow-cheatsheet-physical-layout-iso
  "
┏━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━━━━━┓
┃  <TLDE> │  <AE01> │  <AE02> │  <AE03> │  <AE04> │  <AE05> │  <AE06> │  <AE07> │  <AE08> │  <AE09> │  <AE10> │  <AE11> │  <AE12> │        BKSP ┃
┃         |         |         |         |         |         |         |         |         |         |         |         |         |             ┃
┠─┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┤             ┃
┃         │         │         │         │         │         │         │         │         │         │         │         │         │             ┃
┃         |         |         |         |         |         |         |         |         |         |         |         |         |             ┃
┠─────────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────┴───┬─────────┨
┃        TAB  │  <AD01> │  <AD02> │  <AD03> │  <AD04> │  <AD05> │  <AD06> │  <AD07> │  <AD08> │  <AD09> │  <AD10> │  <AD11> │  <AD12> │         ┃
┃             |         |         |         |         |         |         |         |         |         |         |         |         |         ┃
┃             ├┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┤         ┃
┃             │         │         │         │         │         │         │         │         │         │         │         │         │   RET   ┃
┃             |         |         |         |         |         |         |         |         |         |         |         |         |         ┃
┠─────────────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┬───────┴─┐       ┃
┃               │  <AC01> │  <AC02> │  <AC03> │  <AC04> │  <AC05> │  <AC06> │  <AC07> │  <AC08> │  <AC09> │  <AC10> │  <AC11> │  <BKSL> │       ┃
┃               |         |         |         |         |         |         |         |         |         |         |         │         │       ┃
┃               ├┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┤       ┃
┃               │         │         │         │         │         │         │         │         │         │         │         │         │       ┃
┃               |         |         |         |         |         |         |         |         |         |         |         |         |       ┃
┠───────────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────┬───┴─────────┴───────┨
┃           │  <LSGT> │  <AB01> │  <AB02> │  <AB03> │  <AB04> │  <AB05> │  <AB06> │  <AB07> │  <AB08> │  <AB09> │  <AB10> │                     ┃
┃           |         |         |         |         |         |         |         |         |         |         |         |                     ┃
┃           ├┄┄┄┄┄┄┄┄┄├┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┼┄┄┄┄┄┄┄┄┄┤                     ┃
┃           │         │         │         │         │         │         │         │         │         │         │         │                     ┃
┃           |         |         |         |         |         |         |         |         |         |         |         |                     ┃
┗━━━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━╅─────────┴─────────┴─────────┴─────────╆━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━━━━━━━━━━━━━┛
                                                    ┃                                   SPC ┃
                                                    ┃                                       ┃
                                                    ┃                                       ┃
                                                    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
")

(defconst meow-cheatsheet-layout-qwerty
  '((<TLDE> "`"	"~")
    (<AE01> "1"	"!")
    (<AE02> "2"	"@")
    (<AE03> "3"	"#")
    (<AE04> "4"	"$")
    (<AE05> "5"	"%")
    (<AE06> "6"	"^")
    (<AE07> "7"	"&")
    (<AE08> "8"	"*")
    (<AE09> "9"	"(")
    (<AE10> "0"	")")
    (<AE11> "-"	"_")
    (<AE12> "="	"+")
    (<AD01> "q"	"Q")
    (<AD02> "w"	"W")
    (<AD03> "e"	"E")
    (<AD04> "r"	"R")
    (<AD05> "t"	"T")
    (<AD06> "y"	"Y")
    (<AD07> "u"	"U")
    (<AD08> "i"	"I")
    (<AD09> "o"	"O")
    (<AD10> "p"	"P")
    (<AD11> "["	"{")
    (<AD12> "]"	"}")
    (<AC01> "a"	"A")
    (<AC02> "s"	"S")
    (<AC03> "d"	"D")
    (<AC04> "f"	"F")
    (<AC05> "g"	"G")
    (<AC06> "h"	"H")
    (<AC07> "j"	"J")
    (<AC08> "k"	"K")
    (<AC09> "l"	"L")
    (<AC10> ";"	":")
    (<AC11> "'"	"\"")
    (<AB01> "z"	"Z")
    (<AB02> "x"	"X")
    (<AB03> "c"	"C")
    (<AB04> "v"	"V")
    (<AB05> "b"	"B")
    (<AB06> "n"	"N")
    (<AB07> "m"	"M")
    (<AB08> ","	"<")
    (<AB09> "."	">")
    (<AB10> "/"	"?")
    (<BKSL> "\\" "|")))

(defconst meow-cheatsheet-layout-dvorak
  '((<TLDE> "`"	"~")
    (<AE01> "1"	"!")
    (<AE02> "2"	"@")
    (<AE03> "3"	"#")
    (<AE04> "4"	"$")
    (<AE05> "5"	"%")
    (<AE06> "6"	"^")
    (<AE07> "7"	"&")
    (<AE08> "8"	"*")
    (<AE09> "9"	"(")
    (<AE10> "0"	")")
    (<AE11> "["	"{")
    (<AE12> "]" "}")
    (<AD01> "'"	"\"")
    (<AD02> ","	"<")
    (<AD03> "."	">")
    (<AD04> "p"	"P")
    (<AD05> "y"	"Y")
    (<AD06> "f"	"F")
    (<AD07> "g"	"G")
    (<AD08> "c"	"C")
    (<AD09> "r"	"R")
    (<AD10> "l"	"L")
    (<AD11> "/"	"?")
    (<AD12> "="	"+")
    (<AC01> "a"	"A")
    (<AC02> "o"	"O")
    (<AC03> "e"	"E")
    (<AC04> "u"	"U")
    (<AC05> "i"	"I")
    (<AC06> "d"	"D")
    (<AC07> "h"	"H")
    (<AC08> "t"	"T")
    (<AC09> "n"	"N")
    (<AC10> "s"	"S")
    (<AC11> "-"	"_")
    (<AB01> ";"	":")
    (<AB02> "q"	"Q")
    (<AB03> "j"	"J")
    (<AB04> "k"	"K")
    (<AB05> "x"	"X")
    (<AB06> "b"	"B")
    (<AB07> "m"	"M")
    (<AB08> "w"	"W")
    (<AB09> "v"	"V")
    (<AB10> "z"	"Z")
    (<BKSL> "\\" "|")))

(defconst meow-cheatsheet-layout-colemak
  '((<TLDE> "`" "~")
    (<AE01> "1" "!")
    (<AE02> "2" "@")
    (<AE03> "3" "#")
    (<AE04> "4" "$")
    (<AE05> "5" "%")
    (<AE06> "6" "^")
    (<AE07> "7" "&")
    (<AE08> "8" "*")
    (<AE09> "9" "(")
    (<AE10> "0" ")")
    (<AE11> "-" "_")
    (<AE12> "=" "+")
    (<AD01> "q" "Q")
    (<AD02> "w" "W")
    (<AD03> "f" "F")
    (<AD04> "p" "P")
    (<AD05> "g" "G")
    (<AD06> "j" "J")
    (<AD07> "l" "L")
    (<AD08> "u" "U")
    (<AD09> "y" "Y")
    (<AD10> ";" ":")
    (<AD11> "[" "{")
    (<AD12> "]" "}")
    (<BKSL> "\\" "|")
    (<AC01> "a" "A")
    (<AC02> "r" "R")
    (<AC03> "s" "S")
    (<AC04> "t" "T")
    (<AC05> "d" "D")
    (<AC06> "h" "H")
    (<AC07> "n" "N")
    (<AC08> "e" "E")
    (<AC09> "i" "I")
    (<AC10> "o" "O")
    (<AC11> "'" "\"")
    (<AB01> "z" "Z")
    (<AB02> "x" "X")
    (<AB03> "c" "C")
    (<AB04> "v" "V")
    (<AB05> "b" "B")
    (<AB06> "k" "K")
    (<AB07> "m" "M")
    (<AB08> "," "<")
    (<AB09> "." ">")
    (<AB10> "/" "?")
    (<LSGT> "-" "_")))

(defconst meow-cheatsheet-layout-dvp
  '((<TLDE> "$" "~")
    (<AE01> "&" "%")
    (<AE02> "{" "7")
    (<AE03> "}" "5")
    (<AE04> "}" "3")
    (<AE05> "(" "1")
    (<AE06> "=" "9")
    (<AE07> "*" "0")
    (<AE08> ")" "2")
    (<AE09> "+" "4")
    (<AE10> "]" "6")
    (<AE11> "!" "8")
    (<AE12> "#" "`")
    (<AD01> ";"	":")
    (<AD02> ","	"<")
    (<AD03> "."	">")
    (<AD04> "p"	"P")
    (<AD05> "y"	"Y")
    (<AD06> "f"	"F")
    (<AD07> "g"	"G")
    (<AD08> "c"	"C")
    (<AD09> "r"	"R")
    (<AD10> "l"	"L")
    (<AD11> "/"	"?")
    (<AD12> "@"	"^")
    (<AC01> "a"	"A")
    (<AC02> "o"	"O")
    (<AC03> "e"	"E")
    (<AC04> "u"	"U")
    (<AC05> "i"	"I")
    (<AC06> "d"	"D")
    (<AC07> "h"	"H")
    (<AC08> "t"	"T")
    (<AC09> "n"	"N")
    (<AC10> "s"	"S")
    (<AC11> "-"	"_")
    (<AB01> "'"	"\"")
    (<AB02> "q"	"Q")
    (<AB03> "j"	"J")
    (<AB04> "k"	"K")
    (<AB05> "x"	"X")
    (<AB06> "b"	"B")
    (<AB07> "m"	"M")
    (<AB08> "w"	"W")
    (<AB09> "v"	"V")
    (<AB10> "z"	"Z")
    (<BKSL> "\\" "|")))

(provide 'meow-cheatsheet-layout)
;;; meow-cheatsheet-layout.el ends here
