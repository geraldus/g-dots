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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#383830" "#f92672" "#a6e22e" "#f4bf75" "#66d9ef" "#ae81ff" "#66d9ef" "#f5f4f1"])
 '(ansi-term-color-vector
   [unspecified "#FAFAFA" "#FF1744" "#66BB6A" "#FFA000" "#42A5F5" "#7E57C2" "#0097A7" "#546E7A"] t)
 '(beacon-color "#ec4780")
 '(c-basic-offset 2)
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 2)
 '(company-selection-wrap-around t)
 '(company-show-numbers t)
 '(company-tooltip-align-annotations t)
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-theme-directory "~/.emacs.d/themes/")
 '(debug-on-error nil)
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(electric-pair-pairs (quote ((34 . 34) (96 . 96))))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(eshell-buffer-maximum-lines 4096)
 '(eshell-output-filter-functions
   (quote
    (eshell-truncate-buffer eshell-postoutput-scroll-to-bottom eshell-handle-control-codes eshell-handle-ansi-color eshell-watch-for-password-prompt)))
 '(fci-rule-color "#49483E")
 '(fill-column 80)
 '(flx-ido-mode t)
 '(flycheck-check-syntax-automatically (quote (save idle-change new-line mode-enabled)))
 '(flycheck-haskell-hlint-executable "hlint-emacs")
 '(flycheck-temp-prefix ".flycheck")
 '(frame-background-mode (quote dark))
 '(fringe-mode (quote (8 . 4)) nil (fringe))
 '(gnus-logo-colors (quote ("#0d7b72" "#adadad")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "tmp" ".cabal-sandbox" "dist" ".stack-work" "work/smarty")))
 '(grep-find-ignored-files
   (quote
    (".#*" "*.hi" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "#*#")))
 '(grep-highlight-matches t)
 '(haskell-hoogle-command "hoogle")
 '(haskell-indent-spaces 2)
 '(haskell-indentation-show-indentations nil)
 '(haskell-indentation-show-indentations-after-eol nil)
 '(haskell-process-args-cabal-repl
   (quote
    ("--ghc-options=-ferror-spans" "--with-ghc=ghci-ng")))
 '(haskell-process-args-stack-ghci (quote ("--ghc-options=-ferror-spans")))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-path-ghci "ghci")
 '(haskell-process-reload-with-fbytecode t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-use-presentation-mode t)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hindent-style "chris-done")
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(ido-ignore-directories
   (quote
    ("\\`CVS/" "\\`\\.\\./" "\\`\\./" "\\`~/Downloads/")))
 '(indent-guide-recursive t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(line-spacing 0.32)
 '(linum-format (quote dynamic))
 '(magit-diff-use-overlays nil)
 '(magit-last-seen-setup-instructions "1.4.0" t)
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(powerline-default-separator (quote utf-8))
 '(safe-local-variable-values
   (quote
    ((hamlet/basic-offset . 2)
     (haskell-process-use-ghci . t)
     (haskell-indent-spaces . 2)
     (haskell-process-type . stack-ghci)
     (haskell-process-type quote stack-ghci)
     (haskell-stylish-on-save)
     (flycheck-haskell-ghc-executable . "ghcjs"))))
 '(savehist-file "~/.emacs.d/tmp/savehist")
 '(shm-indent-spaces 4)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(smarty-left-delimiter "<{")
 '(smarty-right-delimiter "}>")
 '(smex-history-length 33)
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(tab-stop-list (number-sequence 2 80 2))
 '(tab-width 2)
 '(tabbar-background-color "#ffffff")
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tramp-auto-save-directory "~/.emacs.d/tmp")
 '(tramp-default-method "ssh")
 '(undo-limit 10485760)
 '(undo-strong-limit 10485760)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color "#93115C")
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-current-column-highlight t)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-markup-indent-offset 2)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(when (not (facep (aref ansi-term-color-vector 0))))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:weight medium :height 130 :family "Ubuntu Mono"))))
 '(whitespace-newline ((t (:inherit whitespace-space)))))

;; простые вещи в первую очередь!
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode 1)
(add-hook 'prog-mode-hook #'linum-mode)


(when (memq window-system '(mac ns))
  ;; ⌥ Option  ≡ Meta <M>
  (setq mac-option-modifier 'meta)
  ;; ⌘ Command ≡ Control <C>
  (setq mac-command-modifier 'control)
  ;; ⌃ Control ≡ Hyper <H>
  (setq mac-control-modifier 'hyper))

(global-set-key (kbd "C-M-:") #'eval-buffer)
(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window -1)))

(electric-indent-mode 1)
(electric-pair-mode 1)

;; ===========================
;; Некоторые сочетания клавиш:
;; ===========================

(global-set-key (kbd "H-SPC") 'set-mark-command)

(global-set-key (kbd "C-S-d") 'delete-backward-char)


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


;; ==========
;; Undo-Tree:
;; ==========
(require 'undo-tree)
(global-undo-tree-mode)

(require 'diminish)
(add-hook 'after-init-hook
          (lambda ()
            (diminish 'flycheck-mode "⨠")
            (diminish 'whitespace-mode "⨀")
            (diminish 'auto-revert-mode "↻")
            (diminish 'company-mode "⧊")
            (diminish 'undo-tree-mode "⎌")))



;; ==================================
;; Умное перемещение в начало строки:
;; ==================================
(require 'smarter-move-begining-of-line)

;; быстро выделить всё до конца строки
(require 'mark-from-point-to-line-end)
(global-set-key (kbd "C-S-<return>") 'mark-from-point-to-line-end)


;; ==============
;; Expand-region:
;; ==============
(global-set-key (kbd "C-=") 'er/expand-region)


;; =================
;; Multiple-Cursors:
;; =================
(require 'multiple-cursors)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-unset-key (kbd "H-S-d")) ;; C-S-d >> C-d не используется напрямую
(global-set-key (kbd "H-d") 'mc/mark-all-dwim)
(global-set-key (kbd "C-S-<mouse1>") 'mc/add-cursor-on-click)

(require 'evil)
(evil-mode 1)
(require 'powerline)
(require 'powerline-evil)
(require 'spaceline-config)
(spaceline-spacemacs-theme)
(setq spaceline-highlight-face-func #'spaceline-highlight-face-evil-state)


(define-key evil-motion-state-map (kbd "<tab>") #'indent-for-tab-command)
(define-key evil-motion-state-map (kbd "C-I") #'evil-jump-forward)
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


;; =====
;; Smex:
;; =====
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") #'smex)
(global-set-key (kbd "M-X") #'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") #'execute-extended-command)


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


;; ============
;; Внешний вид:
;; ============

(column-number-mode t)
(show-paren-mode t)

;; подстветка строк в при просмотре списка пакетов
;; (add-hook 'package-menu-mode-hook #'hl-line-mode)

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
(add-hook 'before-save-hook #'delete-trailing-whitespace)

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


(defvar g:bold-faces nil "A variable to hold a list of bold faces.")

(add-hook
 'after-init-hook
 (lambda ()
   (dolist (face (face-list))
     (when (eq (face-attribute face :weight nil nil) 'bold)
       (push face g:bold-faces)
       ))))

(defun g:make-bold-faces-lighter (&optional weight)
  "Make all bold faces lighter.
By default it substitutes 'bold weight with 'regualar unless
given optional argument, in that case sets weight to WEIGHT
instead."
    (let ((w (or weight 'regular)))
      (dolist (face g:bold-faces)
        (set-face-attribute face nil :weight w))))

(defun g:restore-bold-faces ()
  "Reset bold faces."
  (dolist (face g:bold-faces)
      (set-face-attribute face nil :weight 'bold)))

(add-hook 'after-init-hook #'g:make-bold-faces-lighter)


;; Переназначение шрифта для кириллицы
;; TODO Добавить остальные группы кириллицы
;;      Переназначать шрифт только в тех случаях,
;;      когда отсутствует поддержка кириллицы в основном шрифте
;; (set-fontset-font "fontset-default" '(#x0400 . #x04ff) "Courier New") ;; ВКЛ
;; (set-fontset-font "fontset-default" '(#x0400 . #x04ff) nil) ;; - ОТКЛ

(provide '.emacs)
;;; .emacs ends here
