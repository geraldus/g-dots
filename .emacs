;;; g.emacs --- G-Emacs configuration
;;; Commentary:
;;; G-Emacs configuration

;;; FIXME описать список нужных пакетов и проверку установленных

;;; Code:


;; ==============
;; Сборка мусора:
;; ==============

(setq gc-cons-threshold 104857600)


;; ==================
;; Источники пакетов:
;; ==================

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; Для таких важных библиотек совместимости как cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/g")
;; this requires Solarized theme from
;; https://github.com/sellout/emacs-color-theme-solarized
(add-to-list 'custom-theme-load-path
             "~/.emacs.d/themes/emacs-color-theme-solarized/")

;; Устанавливаем все нужные пакеты
(require 'autopack)
(unless (g/packages-installed-p)
  (message "%s" "Refreshing packages database…")
  (package-refresh-contents)
  (dolist (pkg g/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;; =======================================
;;; Easy Customizations! Простые настройки!
;;; =======================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 2)
 '(company-selection-wrap-around t)
 '(company-show-numbers t)
 '(company-tooltip-align-annotations t)
 '(css-indent-offset 2)
 '(cursor-type (quote bar))
 '(eshell-buffer-maximum-lines 4096)
 '(eshell-output-filter-functions
   (quote
    (eshell-truncate-buffer
     eshell-postoutput-scroll-to-bottom
     eshell-handle-control-codes
     eshell-handle-ansi-color
     eshell-watch-for-password-prompt)))
 '(fill-column 80)
 '(flx-ido-mode t)
 '(flycheck-temp-prefix ".flycheck")
 '(fringe-mode (quote (8 . 4)) nil (fringe))
 '(grep-find-ignored-directories
   (quote
    ("SCCS"
     "RCS"
     "CVS"
     "MCVS"
     ".svn"
     ".git"
     ".hg"
     ".bzr"
     "_MTN"
     "_darcs"
     "{arch}"
     "tmp"
     ".cabal-sandbox"
     "dist"
     ".stack-work"
     "work/smarty")))
 '(grep-find-ignored-files
   (quote
    (".#*"
     "*.hi"
     "*.o"
     "*~"
     "*.bin"
     "*.lbin"
     "*.so"
     "*.a"
     "*.ln"
     "*.blg"
     "*.bbl"
     "*.elc"
     "*.lof"
     "*.glo"
     "*.idx"
     "*.lot"
     "*.fmt"
     "*.tfm"
     "*.class"
     "*.fas"
     "*.lib"
     "*.mem"
     "*.x86f"
     "*.sparcf"
     "*.dfsl"
     "*.pfsl"
     "*.d64fsl"
     "*.p64fsl"
     "*.lx64fsl"
     "*.lx32fsl"
     "*.dx64fsl"
     "*.dx32fsl"
     "*.fx64fsl"
     "*.fx32fsl"
     "*.sx64fsl"
     "*.sx32fsl"
     "*.wx64fsl"
     "*.wx32fsl"
     "*.fasl"
     "*.ufsl"
     "*.fsl"
     "*.dxl"
     "*.lo"
     "*.la"
     "*.gmo"
     "*.mo"
     "*.toc"
     "*.aux"
     "*.cp"
     "*.fn"
     "*.ky"
     "*.pg"
     "*.tp"
     "*.vr"
     "*.cps"
     "*.fns"
     "*.kys"
     "*.pgs"
     "*.tps"
     "*.vrs"
     "*.pyc"
     "*.pyo"
     "#*#"
     "*[.-]min.js")))
 '(grep-highlight-matches t)
 '(haskell-hoogle-command "hoogle")
 '(haskell-indent-spaces 2)
 '(haskell-indentation-show-indentations nil)
 '(haskell-indentation-show-indentations-after-eol nil)
 '(haskell-process-args-cabal-repl (quote ("--ghc-options=-ferror-spans")))
 '(haskell-process-args-stack-ghci (quote ("--ghc-options=-ferror-spans")))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-path-ghci "ghci")
 '(haskell-process-reload-with-fbytecode t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-use-presentation-mode t)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(hindent-style "chris-done")
 '(ido-ignore-directories
   (quote
    ("\\`CVS/" "\\`\\.\\./" "\\`\\./" "\\`~/Downloads/")))
 '(indent-guide-recursive t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(line-spacing 0)
 '(linum-format (quote dynamic))
 '(magit-diff-use-overlays nil)
 '(magit-last-seen-setup-instructions "1.4.0" t)
 '(main-line-separator-style (quote chamfer))
 '(powerline-default-separator (quote utf-8))
 '(safe-local-variable-values
   (quote
    ((hamlet/basic-offset . 2)
     (haskell-process-use-ghci . t)
     (haskell-indent-spaces . 2)
     (haskell-process-type . stack-ghci)
     (haskell-stylish-on-save)
     (flycheck-haskell-ghc-executable . "ghcjs"))))
 '(savehist-file "~/.emacs.d/tmp/savehist")
 '(smarty-left-delimiter "<{")
 '(smarty-right-delimiter "}>")
 '(smex-history-length 33)
 '(solarized-high-contrast-mode-line t)
 '(tab-stop-list (number-sequence 2 80 2))
 '(tab-width 2)
 '(undo-limit 10485760)
 '(undo-strong-limit 10485760)
 '(vc-annotate-background nil)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-current-column-highlight t)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-markup-indent-offset 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(default ((t (:weight thin :height 240 :family "Source Code Pro"))))
 )


;; Простые вещи в первую очередь.  Это нужно, чтобы в случае неудачной
;; конфигрурации был доступен самый важный функционал.

;; ============
;; Внешний вид:
;; ============

(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode 1)
(column-number-mode t)
(show-paren-mode t)
(add-hook 'prog-mode-hook #'linum-mode)


(when (memq window-system '(mac ns))
  ;; ⌥ Option  ≡ Meta <M>
  (setq mac-option-modifier 'meta)
  ;; ⌘ Command ≡ Control <C>
  (setq mac-command-modifier 'control)
  ;; ⌃ Control ≡ Hyper <H>
  (setq mac-control-modifier 'hyper))


;; ===========================
;; Некоторые сочетания клавиш:
;; ===========================

(global-set-key (kbd "H-SPC") 'set-mark-command)

(global-set-key (kbd "C-S-d") 'delete-backward-char)

(global-set-key (kbd "C-M-:") #'eval-buffer)

(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window -1)))

;; ==========
;; Undo-Tree:
;; ==========
(require 'undo-tree)
(global-undo-tree-mode)


(electric-indent-mode 1)
(electric-pair-mode 1)
(add-hook 'before-save-hook #'delete-trailing-whitespace)


;; =================
;; Настраиваем пути:
;; =================

(when (string-equal system-type "gnu/linux")
  (add-to-list 'exec-path "~/.local/bin"))
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; ==================================================
;; Умная русская раскладка клавиатуры, с учётом ОС Х:
;; ==================================================
(when (string-equal system-type "darwin")
  (require 'smart-input-methods))


;; ===================================
;; Резервные копии и запись «истории»:
;; ===================================

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
;; Запоминаем введённые команды
(require 'savehist)
(setq history-length 300)
(setq history-delete-duplicates t)
(savehist-mode 1)


;; ====
;; IDo:
;; ====

(require 'ido)
(require 'flx-ido)
(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)
;; отключаем личины IDO, чтобы видеть личины FLX
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq uniquify-buffer-name-style 'post-forward)


;; =====
;; Smex:
;; =====

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") #'smex)
(global-set-key (kbd "M-X") #'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") #'execute-extended-command)


(require 'diminish)
(add-hook 'after-init-hook
          (lambda ()
            (diminish 'flycheck-mode "⨠")
            (diminish 'whitespace-mode "⨀")
            (diminish 'auto-revert-mode "↻")
            (diminish 'company-mode "⧊")
            (diminish 'undo-tree-mode "⎌")))

(require 'whitespace)
(setq whitespace-style
      '(face tabs tab-mark newline newline-mark indentation::space trailing))
(setq whitespace-display-mappings
      '((newline-mark 10  [172 10] [182 10])
        (newline-mark 13  [8617])
        (tab-mark     9   [8677 9])
        (space-mark   32  [183])
        (space-mark   160 [9251])))
;; ¬ | ¶ + перенос строки — для символа новых строк
;; ↩                      — для символа новых строк
;; ⇥ + табуляция          — для символа табуляции
;; ·                      — для пробела
;; ␣                      — для неразрывного пробела
;; если что-то не понятно - прочти описания переменных, сразу всё вспомнишь

(add-hook 'prog-mode-hook #'whitespace-mode)


;; Умное перемещение в начало строки:
(require 'smarter-move-begining-of-line)
;; Быстро выделить всё до конца строки
(require 'mark-from-point-to-line-end)
(global-set-key (kbd "C-S-<return>") 'mark-from-point-to-line-end)


;; ==============
;; Expand-region:
;; ==============

(global-set-key (kbd "C-=") 'er/expand-region)


;; ====================
;; Extensible Vi Layer:
;; ====================

(require 'evil)
(evil-mode 1)
(require 'powerline)
(require 'powerline-evil)
(require 'spaceline-config)
(spaceline-spacemacs-theme)
(setq spaceline-highlight-face-func #'spaceline-highlight-face-evil-state)


(define-key evil-motion-state-map (kbd "<tab>") #'indent-for-tab-command)
(define-key evil-normal-state-map (kbd "<tab>") #'indent-for-tab-command)
(define-key evil-motion-state-map (kbd "C-I") #'evil-jump-forward)
(define-key evil-normal-state-map (kbd "C-I") #'evil-jump-forward)
(define-key evil-normal-state-map (kbd "C-r") #'isearch-backward)
(eval-after-load "evil-maps"
  '(define-key evil-normal-state-map (kbd "q") nil))

(require 'evil-surround)
(global-evil-surround-mode 1)


;; ==============
;; Ace-Jump mode:
;; ==============

;; FIXME перенести в отдельный файл
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") #'ace-jump-mode)


;; ========
;; Haskell:
;; ========

(require 'haskell)
(require 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'haskell-process)

(add-hook 'haskell-mode-hook #'turn-on-font-lock)
(add-hook 'haskell-mode-hook #'interactive-haskell-mode)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

(define-key interactive-haskell-mode-map (kbd "C-c C-t")
  #'haskell-mode-show-type-at)

(defun g:haskell-insert-error-not-implemented-at-point ()
  "Insert 'error \"not implemented\"' operation at point."
  (interactive)
  (insert "error \"not implemented\""))

(define-key interactive-haskell-mode-map (kbd "C-c C-e")
  #'g:haskell-insert-error-not-implemented-at-point)


;; =========
;; FlyCheck:
;; =========

(require 'flycheck)
(setq flycheck-emacs-lisp-load-path 'inherit)
(add-hook 'after-init-hook #'global-flycheck-mode)


;; ========
;; CompAny:
;; ========

(require 'company)
(add-hook 'after-init-hook #'global-company-mode)
(global-set-key (kbd "<f8>") #'company-mode)



;; ====================
;; Совместимость с Git:
;; ====================

(require 'diff-hl)
(add-hook 'prog-mode-hook #'turn-on-diff-hl-mode)

(require 'magit)
(global-set-key (kbd "C-S-g") #'magit-status)


;; ========
;; Org Mode
;; ========

(require 'org)
(setq org-src-fontify-natively t)
(setq org-fontify-emphasized-text t)


;; =================
;; Multiple-Cursors:
;; =================

(require 'multiple-cursors)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-unset-key (kbd "H-S-d")) ;; C-S-d >> C-d не используется напрямую
(global-set-key (kbd "H-d") 'mc/mark-all-dwim)
(global-set-key (kbd "C-S-<mouse1>") 'mc/add-cursor-on-click)


;; =========================
;; Разблокированные функции:
;; =========================

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


;; =======
;; Docker:
;; =======

(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))



;; ====
;; FCI:
;; ====

(require 'fill-column-indicator)
(setq whitespace-line-column 80)
(setq fci-rule-width 2)
(add-hook 'prog-mode-hook (lambda () (fci-mode 1)))
(add-hook 'text-mode-hook (lambda () (fci-mode 1)))

;; отключение FCI при показе подсказок Company
(defvar-local g:company-fci-mode-on-p nil)

(defun g:company-turn-off-fci (&rest ignore)
  "Safely turn off Fill Column Indicator.
If `fci-mode' is enabled disable it and store its state in special variable.
Argument IGNORE is not used"
  (when (boundp 'fci-mode)
    (setq g:company-fci-mode-on-p fci-mode)
    (when fci-mode (fci-mode -1))))

(defun g:company-maybe-turn-on-fci (&rest ignore)
    "Turn on Fill Column Indicator if it was enabled.
If `fci-mode' was enabled turn it on.
Argument IGNORE is not used."
  (when g:company-fci-mode-on-p (fci-mode 1)))

(add-hook 'company-completion-started-hook #'g:company-turn-off-fci)
(add-hook 'company-completion-finished-hook #'g:company-maybe-turn-on-fci)
(add-hook 'company-completion-cancelled-hook #'g:company-maybe-turn-on-fci)


;; ====
;; WEB:
;; ====

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
;; Using web-mode for editing plain HTML files can be done this way
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-hook 'web-mode-hook (lambda () (fci-mode -1)))
(add-hook 'css-mode-hook
          (lambda ()
            (linum-mode 1)
            (diff-hl-mode 1)))

(require 'php-mode)
(require 'smarty-mode)
(c-add-style "php-customized"
             '("php" (c-basic-offset . 2)))
(add-hook 'php-mode-hook (lambda () (c-set-style "php-customized")))

(defun g:insert-php-debug-snippet ()
  "Paste some code for PHP debugging."
  (interactive)
  (insert "echo '<pre>';\n")
  (insert "var_dump(");
  (save-excursion
    (insert ");\n")
    (insert "die;\n")))
(define-key php-mode-map (kbd "C-c C-e")
  #'g:insert-php-debug-snippet)

(global-set-key (kbd "C-c <backspace>") #'tramp-cleanup-this-connection)

;; =======================================
;; Indent-Guide.el --- подсветка отступов.
;; =======================================
(require 'indent-guide)


;; =======
;; Eshell:
;; =======

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
(global-set-key (kbd "M-+") #'g:jump-to-eshell-buffer)


;; ========================
;; Плавная прокрутка мышью:
;; ========================
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))
(when (memq window-system '(mac ns))
  (setq mouse-wheel-progressive-speed nil))


;; ================================
;; Подсветка цветовых кодов от Кса:
;; ================================
(require 'xah-syntax-color-hex)
(add-hook 'prog-mode 'xah-syntax-color-hex)


(defvar g:bold-faces-list nil "A variable to hold a list of bold faces.")

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

(setq g:bold-faces-dim t)

;; (add-hook 'after-init-hook #'g:bold-faces-handle)
;; (add-hook 'after-change-major-mode-hook #'g:bold-faces-handle)
;; (add-hook 'buffer-list-update-hook #'g:bold-faces-handle)


;; Переназначение шрифта для кириллицы
;; TODO Добавить остальные группы кириллицы
;;      Переназначать шрифт только в тех случаях,
;;      когда отсутствует поддержка кириллицы в основном шрифте
;; (set-fontset-font "fontset-default" '(#x0400 . #x04ff) "Courier New") ;; ВКЛ
;; (set-fontset-font "fontset-default" '(#x0400 . #x04ff) nil) ;; - ОТКЛ

(provide '.emacs)
;;; .emacs ends here
