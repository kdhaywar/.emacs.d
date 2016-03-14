
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)


;;;display;;;;;;;;
(global-linum-mode 1)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(setq make-backup-files nil)


(setq tramp-default-method "ssh")

;----------------------;
;;; Windows & Frames ;;;
;----------------------;

; language
(setq current-language-environment "English")

; don't show the startup screen
(setq inhibit-startup-screen t)
; number of characters until the fill column
;(setq fill-column 80)
; display line numbers to the right of the window
(global-linum-mode t)
; show the current line and column numbers in the stats bar as well
(line-number-mode t)
(column-number-mode t)



;;(setq-default abbrev-mode t)
(add-hook 'text-mode-hook (lambda () (abbrev-mode 1)))
(read-abbrev-file "~/.emacs.d/.abbrev_defs")
(setq save-abbrevs t)




(add-to-list 'load-path
              "~/home/kyle/.emacs.d/elpa/yasnippet-20160131.948")
(require 'yasnippet)
(yas-global-mode 1)




(require 'iedit)

(global-flycheck-mode)
(require 'undo-tree)
(global-undo-tree-mode t)


;; ;;;;;;;;;;turn on;;;;;;;;;;;;;;;
;(require 'cc-mode)
;(setq-default c-basic-offset 4 c-default-style "linux")
;(setq-default tab-width 4 indent-tabs-mode t)
;(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)


;(setq-default c-basic-offset 4
;      tab-width 4
;      indent-tabs-mode t)


;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'solarized-dark t)
;; Or alternate color palette
										; (load-theme 'solarized-light t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)




(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)
            (setq indent-tabs-mode t)))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))




(require 'nyan-mode)
(setq nyan-wavy-tail t)
(setq nyan-bar-length 20)
(setq nyan-animate-nyancat t)
(nyan-mode)

(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)


;(add-to-list 'load-path "~/.emacs.d/fill-column-indicator-1.83")
;(require 'fill-column-indicator)
;(define-globalized-minor-mode
; global-fci-mode fci-mode (lambda () (fci-mode 1)))
;(global-fci-mode t)




(load-library "python")

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
                    (set-variable 'indent-offset 4)
                    (set-variable 'indent-tabs-mode nil))))
; python-mode
;;(setq py-install-directory "~/.emacs.d/python-mode-6.0.11")
;;(add-to-list 'load-path py-install-directory)
;;(require 'python-mode)

; use IPython
;;(setq-default py-shell-name "ipython")
;;(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
;;(setq py-python-command-args
;;  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
;;(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
;;(setq py-shell-switch-buffers-on-execute-p t)
;;(setq py-switch-buffers-on-execute-p t)
;; don't split windows
;;(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
;;(setq py-smart-indentation t)





;(defun flycheck-python-setup ()
;  (flycheck-mode))
;(add-hook 'python-mode-hook #'flycheck-python-setup)


;(add-hook 'after-init-hook #'global-flycheck-mode)





(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)



(when (load "home/kyle/.emacs.d/elpy" t)
(package-initialize)
(elpy-enable)
(setq elpy-rpc-backend "jedi") )




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
	("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" default)))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
	(solarized-color-blend it "#002b36" 0.25)
	(quote
	 ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
	(("#073642" . 0)
	 ("#546E00" . 20)
	 ("#00736F" . 30)
	 ("#00629D" . 50)
	 ("#7B6000" . 60)
	 ("#8B2C02" . 70)
	 ("#93115C" . 85)
	 ("#073642" . 100))))
 '(hl-bg-colors
   (quote
	("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
	("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(line-number-mode nil)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
	("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
	(zenburn-theme web-mode yasnippet undo-tree magit virtualenv exec-path-from-shell jedi-direx jedi iedit pylint flycheck python-mode fill-column-indicator auto-complete nyan-mode solarized-theme)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(weechat-color-list
   (quote
	(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;supposed to fix collision issue
;    (defadvice ac-fallback-command (around no-yasnippet-fallback activate)
;      (let ((yas-fallback-behavior nil))
;        ad-do-it))
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
;(define-key yas-minor-mode-map (kbd "C-c j") 'yas-expand)
(define-key yas-minor-mode-map (kbd "C-c ;") 'yas-expand)
;maybe try this
;(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)
