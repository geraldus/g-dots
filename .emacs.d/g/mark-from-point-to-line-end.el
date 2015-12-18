;;; mark-from-point-to-line-end --- Mark everything from point to line end

;;; Commentary:
;;; Mark everything from point to line end and activate mark, leaving point
;;; position untouched

;;; Code:
(defun mark-from-point-to-line-end ()
  "Mark everything from point to end of line."
  (interactive)
  (set-mark (line-end-position))
  (activate-mark))

(provide 'mark-from-point-to-line-end)
;;; mark-from-point-to-line-end.el ends here
