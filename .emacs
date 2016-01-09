;;; g.emacs --- G-Emacs configuration
;;; Commentary:
;;; G-Emacs configuration

;;; FIXME описать список нужных пакетов и проверку установленных

;;; Code:

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
 '(custom-enabled-themes (quote (solarized)))
 '(custom-safe-themes
   (quote
    ("790e74b900c074ac8f64fa0b610ad05bcfece9be44e8f5340d2d94c1e47538de" "94ba29363bfb7e06105f68d72b268f85981f7fba2ddef89331660033101eb5e5" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "f5eb916f6bd4e743206913e6f28051249de8ccfd070eae47b5bde31ee813d55f" "11636897679ca534f0dec6f5e3cb12f28bf217a527755f6b9e744bd240ed47e1" "70f5a47eb08fe7a4ccb88e2550d377ce085fedce81cf30c56e3077f95a2909f2" "c3e6b52caa77cb09c049d3c973798bc64b5c43cc437d449eacf35b3e776bf85c" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "3dafeadb813a33031848dfebfa0928e37e7a3c18efefa10f3e9f48d1993598d3" "3b24f986084001ae46aa29ca791d2bc7f005c5c939646d2b800143526ab4d323" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "6a9606327ecca6e772fba6ef46137d129e6d1888dcfc65d0b9b27a7a00a4af20" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "043065d7c4ce47fbb5a465faa8888b3d4dfdc9a976d23c9375f16aec4401fd8f" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "95f954ce018bbff3107b357bd87d060db195a2d5c6b70411587223597fde171d" "17a8fa9430ffd81f242ed3ee95e59629ccf9e1210657536013a0def9b16e68c9" "234249a92c2cf7b61223d9f83e1d9eefcd80fcf6b7a5e9ca03dc9d3f1b122ae2" "bb6b64bfb2f63efed8dea1ca03691c07c851a8be6f21675fe4909289d68975d9" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" "1934bf7e1713bf706a9cb36cc6a002741773aa42910ca429df194d007ee05c67" "fc2782b33667eb932e4ffe9dac475f898bf7c656f8ba60e2276704fabb7fa63b" "0ae977e603e99d89c80d679377bfed4a904317968bd885ee063455cee01728d3" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "e80932ca56b0f109f8545576531d3fc79487ca35a9a9693b62bf30d6d08c9aaf" "84122204c8cb1658da83e37b0081cbeaaec444a228ff36295642a16a96fd6b86" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "f211f8db2328fb031908c9496582e7de2ae8abd5f59a27b4c1218720a7d11803" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "3a91205cfbbe87a78889e7871000b73e89783dde76550dc32fd6d379a1fe70da" "bc42b14c7719c33ff4b8b4bed01f52500baf2a38f35017a3b71dd169dabae0d7" "49a981154962c8e21b9f38b64da9d531c456027c157d0fee0bfcfed3add1c631" "34e7163479ef3669943b3b9b1fabe639d6e0a0453e0de79cea2c52cb520d3bc4" "5cd698ce53179b1e4eaa7917c992832a220600c973967904fea71e3980a46532" "b48599e24e6db1ea612061252e71abc2c05c05ac4b6ad532ad99ee085c7961a7" "8d1baba3bbafc11628972b5b0a4453b5120be4fb8d30ad0ca4b35d114422dd65" "cc2f32f5ee19cbd7c139fc821ec653804fcab5fcbf140723752156dc23cdb89f" "008775b6f17cba84b22da8c820d9c6778fac161291f1a9cc252a7e735714bc56" "adbe7ba38c551281f21d760de0840cab0e1259964075a7e46cc2b9fdea4b82d6" "06a610f234492f78a6311304adffa54285b062b3859ad74eb13ca5d74119aef9" "d251c0f968ee538a5f5b54ed90669263f666add9c224ad5411cfabc8abada5a0" "7ec6a9707c69e7a4ea1a8761b3f28f8dc55c6c5cacd597718c994b1561e435f3" "55573f69249d1cfdd795dacf1680e56c31fdaab4c0ed334b28de96c20eec01a3" "c1af7190a6855a376f7a7563445687064af6d8bdca423136cb013c93fbfd1b00" "0ff3aeed353697992d100ddf8a94d065a58ffbde5a40afefa605f211757c8ab0" "70b9e0d0b857d6497c6623bb360a3a7f915251c4a6233c30b65f9005eb9f4256" "2588175e0f3591583582a72c465e6d38bd8c99b36daee949ab08f1e758052117" "31772cd378fd8267d6427cec2d02d599eee14a1b60e9b2b894dd5487bd30978e" "2c50bf38069a99a18404275e8d139a8a1019a629dab4be9b92b8d5d9c43bbb92" "a405a0c2ec845e34ecb32a83f477ca36d1858b976f028694e0ee7ff4af33e400" "0ca71d3462db28ebdef0529995c2d0fdb90650c8e31631e92b9f02bd1bfc5f36" "caa9a86ff9b85f733b424f520ec6ecff3499a36f20eb8d40e3096dbbe1884069" "2fc7672758572337a2c9d748d8f53cc7839244642e4409b375baef6152400b4d" "6c57adb4d3da69cfb559e103e555905c9eec48616104e217502d0a372e63dcea" "fe20c1ea61a2836a5cea69963865b5b8df8c480ccaf3f11ad7f2e1f543f6c274" "764e3a6472a3a4821d929cdbd786e759fab6ef6c2081884fca45f1e1e3077d1d" "8cf56691a70156f611ac86d0bbcbc7dee7673df195de5918f34bfdc6814ffd39" "49e5a7955b853f70d1fe751b2f896921398b273aa62f47bda961a45f80219581" "2a86b339554590eb681ecf866b64ce4814d58e6d093966b1bf5a184acf78874d" "0f0adcd1352b15a622afd48fcff8232169aac4b5966841e506f815f81dac44ea" "8d6fb24169d94df45422617a1dfabf15ca42a97d594d28b3584dc6db711e0e0b" "08efabe5a8f3827508634a3ceed33fa06b9daeef9c70a24218b70494acdf7855" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "c56d90af9285708041991bbc780a073182cbe91721de17c6e7a8aac1380336b3" "c537bf460334a1eca099e05a662699415f3971b438972bed499c5efeb821086b" "5562060e16ae3188e79d87e9ba69d70a6922448bcc5018205850d10696ed0116" default)))
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
 '(linum-format (quote dynamic))
 '(magit-diff-use-overlays nil)
 '(magit-last-seen-setup-instructions "1.4.0" t)
 '(magit-use-overlays t t)
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
;; (add-to-list 'load-path "~/GitHub/ace-jump-mode")
;; (add-to-list 'load-path "~/GitHub/forks/haskell-mode")
;; (add-to-list 'load-path "~/GitHub/structured-haskell-mode/elisp")

(when (string-equal system-type "gnu/linux")
  (add-to-list 'exec-path "~/.local/bin"))
;; (let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
;;   (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
;;   (add-to-list 'exec-path my-cabal-path))
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; http://emacsredux.com/blog/2013/04/21/edit-files-as-root/
;; Возможность сохранять доступные только для чтения файлы от пользователя root
;; не работает
;; (defadvice ido-find-file (after find-file-sudo activate)
;;   "Find file as root if necessary."
;;   (unless (and buffer-file-name
;;                (file-writable-p buffer-file-name))
;;     (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
;;
;; не работает
;; (defun sudo-edit (&optional arg)
;;   "Edit currently visited file as root.

;; With a prefix ARG prompt for a file to visit.
;; Will also prompt for a file to visit if current
;; buffer is not visiting a file."
;;   (interactive "P")
;;   (if (or arg (not buffer-file-name))
;;       (find-file (concat "/sudo:root@localhost:"
;;                          (ido-read-file-name "Find file(as root): ")))
;;     (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

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

(define-key evil-motion-state-map (kbd "<tab>") #'indent-for-tab-command)
(define-key evil-motion-state-map (kbd "C-I") #'evil-jump-forward)
(define-key evil-normal-state-map (kbd "C-r") #'isearch-backward)
(eval-after-load "evil-maps"
  '(define-key evil-normal-state-map (kbd "q") nil))

;; FIXME Это неправильное решение, нужно менять курсор отдельно для каждого
;; буфера!
;; (defun g:set-buffer-cursor (type)
;;   "Change cursor appearance for current buffer."
;;   (message "Current cursor type is %s" cursor-type)
;;   (modify-frame-parameters
;;    (selected-frame)
;;    (list (cons 'cursor-type 'type)))
;;   (message "New cursor type is %s" cursor-type))
;; (defun g:evil-manage-cursor-type ()
;;   "Change cursor type depending on evil mode."
;;   (if (bound-and-true-p 'evil-mode)
;;       (if (evil-emacs-state-p)
;;           (g:set-buffer-cursor 'box)
;;         (g:set-buffer-cursor 'bar))
;;     (g:set-buffer-cursor 'box)))
;; (add-hook 'buffer-list-update-hook #'g:evil-manage-cursor-type)

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
;; (add-hook 'haskell-mode-hook #'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook #'turn-on-haskell-decl-scan)


;; (add-hook 'haskell-mode-hook
;;           (lambda ()
;;             (remove-hook 'completion-at-point-functions
;;                          #'haskell-process-completions-at-point
;;                          t)
;;             (add-hook 'completion-at-point-functions
;;                       #'haskell-completions-sync-completions-at-point
;;                       nil
;;                       t)))

(define-key interactive-haskell-mode-map (kbd "C-c C-t")
  #'haskell-mode-show-type-at)

(defun g:haskell-insert-error-not-implemented-at-point ()
  "Insert 'error \"not implemented\"' operation at point."
  (interactive)
  (insert "error \"not implemented\""))

(define-key interactive-haskell-mode-map (kbd "C-c C-e")
  #'g:haskell-insert-error-not-implemented-at-point)

;; (add-to-list 'auto-mode-alist '("\\.julius\\'" . js-mode))


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
(setq magit-use-overlays t)
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
(add-hook 'prog-mode-hook #'linum-mode)
(column-number-mode t)
(show-paren-mode t)

;; подстветка строк в при просмотре списка пакетов
(add-hook 'package-menu-mode-hook #'hl-line-mode)

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

;; (setq-default line-spacing 0.1)
;; (set-frame-font "American Typewriter-14:weight=normal" t)
;; (set-frame-font "Anonymous Pro Minus-13" t)
;; (set-frame-font "Consolas-13" t)
;; (set-frame-font "Courier New-13:weight=light" t)
;; (set-frame-font "Fira Mono-12" t)
;; (set-frame-font "Input-14" t)
;; (set-frame-font "Inconsolata LGC-12" t)
;; (set-frame-font "Liberation Mono-13" t)
;; (set-frame-font "M+ 1m-13:weight=light" t)
;; (set-frame-font "Menlo-13:weight=light" t)
;; (set-frame-font "NK57 Monospace-14:weight=light" t)
;; (set-frame-font "PT Mono-13" t)
;; (set-frame-font "Liberation Mono-12" t)
;; (set-frame-font "Roboto Mono-12" t)
;; (set-frame-font "Ubuntu Mono-14" t)
;; Переназначение шрифта для кириллицы
;; TODO Добавить остальные группы кириллицы
;;      Переназначать шрифт только в тех случаях,
;;      когда отсутствует поддержка кириллицы в основном шрифте
;; (set-fontset-font "fontset-default" '(#x0400 . #x04ff) "Courier New") ;; ВКЛ
;; (set-fontset-font "fontset-default" '(#x0400 . #x04ff) nil) ;; - ОТКЛ

;;; Спросить про Typewriter шрифт
;;; Спросить про инициализацию записи

;; (set-fontset-font "fontset-default" '(#x0000 . #x04ff) "American Typewriter") ;; ВКЛ
;; (set-fontset-font "fontset-default" '(#x0001 . #x04ff) nil) ;; - ОТКЛ

(provide '.emacs)
;;; .emacs ends here
