;;; fonts-per-window --- Configure fonts per window.

(require 'face-remap)
(require 'fill-column-indicator)

;;; Commentary:

;; Adjust font configuration for each window separetely.

;; Initial code written by Jordon Biondo (URL
;; `http://emacs.stackexchange.com/a/13263/6844')

;;; Code:

(defun g-buffer-resize-font-for-window ()
  "Scale the buffer's text for the current window."
  (let ((scale (or (window-parameter (selected-window) 'my-custom-font-scale)
                   0)))
    (when (integerp scale)
      (let ((text-scale-mode-amount scale))
        (when (and (not (eq scale 0))
                   fci-mode)
          (fci-mode -1))
        (text-scale-mode t)))))

(defun g-set-window-font-scale (&optional scale)
  "Set the window scale for the current window.
Provide optional arg SCALE to override default 0 height."
  (interactive
   (list (string-to-number
          (completing-read "Window Font Scale: "
                           (mapcar 'number-to-string
                                   (number-sequence -5 5))
                           nil
                           t))))
  (set-window-parameter (selected-window) 'my-custom-font-scale scale)
  (g-buffer-resize-font-for-window))

(add-hook 'buffer-list-update-hook #'g-buffer-resize-font-for-window)

(provide 'fonts-per-window)
;;; fonts-per-window.el ends here
