;;; autopack --- Automatically install neccessary packages from MELPA.

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defvar g/packages
  '(ace-jump-mode
    company
    color-theme-sanityinc-tomorrow
    diff-hl
    dockerfile-mode
    exec-path-from-shell
    expand-region
    fill-column-indicator
    flatui-theme
    flx-ido
    flycheck
    flycheck-haskell
    haskell-mode
    magit
    markdown-mode
    multiple-cursors
    smex
    shakespeare-mode
    undo-tree
    web-mode
    yaml-mode)
  "List of packages to be installed from archives.")

(defun g/packages-installed-p ()
  "Determine if all packages are installed."
  (cl-loop for pkg in g/packages
           when (not (package-installed-p pkg)) do (cl-return nil)
           finally (cl-return t)))

(provide 'autopack)
;;; autopack.el ends here
