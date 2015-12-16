;;; smarter-move-begining-of-line --- Smart jump to beggining of a line

;;; Commentary:
;;;TODO

;;; Code:
(defun smarter-move-begining-of-line (arg)
  "FIXME.
ARG"

  (interactive "^p")
  (setq arg (or arg 1))

  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key [remap move-beginning-of-line]
                'smarter-move-begining-of-line)

(provide 'smarter-move-begining-of-line)

;;; smarter-move-begining-of-line.el ends here
