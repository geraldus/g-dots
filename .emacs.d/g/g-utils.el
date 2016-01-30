;;; g-utils.el --- Some useful text navigation and manipulation commands.

;;; Commentary:

;;; Code:

(defvar g:bold-faces-list nil "A variable to hold a list of bold faces.")


(defun g:toggle-jump-line-beginning (arg)
  "Jump to beginning of the line or to first non-whitespace char.
Move ARG lines forward first, negative ARG means move backward.
If point is further than first non-whitespace character of line
it jumps to it first, when triggered second time it jumps to the
beginning of the line."
  (interactive "^p")
  (setq arg (or arg 1))

  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defun g:mark-from-point-to-line-end ()
  "Mark everything from point to end of line."
  (interactive)
  (set-mark (line-end-position))
  (activate-mark))

(defun g:jump-to-eshell-buffer ()
  "Quickly jump to *eshell* buffer."
  (interactive)
  (let ((cur (buffer-name))
        (esh "*eshell*"))
    (switch-to-buffer
     (if (equal cur esh)
         (other-buffer (current-buffer) 1)
       (if (get-buffer esh)
           esh
         (eshell))))))

(defvar g:bold-faces-dim nil
  "A flag indicating should bold faces be lighter.
Possible values are: either t or nil or explicit symbol that
should be used as face `:weight'.  nil means that bold faces
should have default bold weight, t changes bold to regular, if
explicit symbol is given it will be used as weight for bold
faces.")

(defun g:bold-faces-collect ()
  "Find all faces with weight set to 'bold and store them into special variable."
  (dolist (face (face-list))
    (when (eq (face-attribute face :weight nil nil) 'bold)
      (add-to-list 'g:bold-faces-list face))))

(defun g:bold-faces-make-lighter (&optional weight)
  "Make all bold faces lighter.
By default it substitutes 'bold weight with 'regualar unless
given optional argument, in that case sets weight to WEIGHT
instead."
    (let ((w (or weight 'regular)))
      (dolist (face g:bold-faces-list)
        (set-face-attribute face nil :weight w))))

(defun g:bold-faces-restore ()
  "Reset bold faces."
  (dolist (face g:bold-faces-list)
      (set-face-attribute face nil :weight 'bold)))

(defun g:bold-faces-handle ()
  "Handle bold faces.
This function checks the value of `g:bold-faces-dim' and if its
value other to nil it replaces faces weight according to value.
Otherwise it restores default bold weight."
  (g:bold-faces-collect)
  (if (eq g:bold-faces-dim nil)
      (g:bold-faces-restore)
    (let ((w (if (eq g:bold-faces-dim t) nil g:bold-faces-dim)))
      (g:bold-faces-make-lighter w))))


(provide 'g-utils)
;;; g-utils.el ends here
