;;; smart-input-methods --- correct russian input  method on OS X

;;; Commentary:
;;; Smartly modify russian input to correspond Apple keyboard layout when
;;; running under OS X.

;;; Code:

(if (eq system-type 'darwin)
    (progn
      (quail-define-package
       "russian-mac" "Russian" "RU" nil
       "ЙЦУКЕН Russian Mac layout"
       nil t t t t nil nil nil nil nil t)

      ;; >< 1! 2" 3№ 4% 5: 6, 7. 8; 9( 0) -_ =+
      ;;     Й  Ц  У  К  Е  Н  Г  Ш  Щ  З  Х  Ъ
      ;;      Ф  Ы  В  А  П  Р  О  Л  Д  Ж  Э  Ё
      ;;   ][  Я  Ч  С  М  И  Т  Ь  Б  Ю  /?

      (quail-define-rules
                                        ; row 1
       ("§" ?>)
                                        ; row 2
       ("q" ?й) ("w" ?ц) ("e" ?у) ("r" ?к) ("t" ?е) ("y" ?н) ("u" ?г) ("i" ?ш)
       ("o" ?щ) ("p" ?з) ("[" ?х) ("]" ?ъ)
                                        ; row 3
       ("a" ?ф) ("s" ?ы) ("d" ?в) ("f" ?а) ("g" ?п) ("h" ?р) ("j" ?о) ("k" ?л)
       ("l" ?д) (";" ?ж) ("'" ?э) ("\\" ?ё)
                                        ; row 4
       ("`" ?\]) ("z" ?я) ("x" ?ч) ("c" ?с) ("v" ?м) ("b" ?и) ("n" ?т) ("m" ?ь)
       ("," ?б) ("." ?ю)
                                        ; Shift row 1
       ("±" ?<) ("@" ?\") ("#" ?№) ("$" ?%) ("%" ?:) ("^" ?,) ("&" ?.)
       ("*" ?\;)
                                        ; Shift row 2
       ("Q" ?Й) ("W" ?Ц) ("E" ?У) ("R" ?К) ("T" ?Е) ("Y" ?Н) ("U" ?Г) ("I" ?Ш)
       ("O" ?Щ) ("P" ?З) ("{" ?Х) ("}" ?Ъ)
                                        ; Shift row 3
       ("A" ?Ф) ("S" ?Ы) ("D" ?В) ("F" ?А) ("G" ?П) ("H" ?Р) ("J" ?О) ("K" ?Л)
       ("L" ?Д) (":" ?Ж) ("\"" ?Э) ("|" ?Ё)
                                        ; Shift row 4
       ("~" ?\[) ("Z" ?Я) ("X" ?Ч) ("C" ?С) ("V" ?М) ("B" ?И) ("N" ?Т) ("M" ?Ь)
       ("<" ?Б) (">" ?Ю))

      (setq default-input-method "russian-mac"))

  (setq default-input-method "russian-computer"))

(provide 'smart-input-methods)
;;; smart-input-methods.el ends here
