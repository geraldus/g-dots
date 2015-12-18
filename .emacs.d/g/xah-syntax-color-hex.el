;;; xah-syntax-color-hex --- Highlight HEX color strings with their color
;;; representations

;;; Commentary:
;;; Code grabbed from
;;; http://ergoemacs.org/emacs/emacs_CSS_colors.html

;;; Code:

(defun xah-syntax-color-hex ()
"Syntax color hex color spec such as 「#ff1100」 in current buffer."
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[abcdef[:digit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-fontify-buffer)
  )

(provide 'xah-syntax-color-hex)
;;; xah-syntax-color-hex.el ends here
