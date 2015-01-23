;; The startup screen is a little patronizing, don't you think?
(setq inhibit-startup-screen t)

;; These are mac specific
(setq mac-command-modifier 'super)

;; I don't like vc-git, and it takes forever to load
(setq vc-handled-backends ())

(add-to-list 'load-path "~/.emacs.d/plugins/")

;; Golang mode
(add-to-list 'load-path "~/.emacs.d/plugins/go-mode.el")
(require 'go-mode-autoloads)

;; Golang autocompletion
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(add-to-list 'load-path "~/.emacs.d/plugins/popup-el")
(require 'auto-complete)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

;; PHP mode and autocompletion
(add-to-list 'load-path "~/.emacs.d/plugins/php-mode")
(require 'php-mode)

;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'sql-mode)
(add-to-list 'ac-modes 'python-mode)
(add-to-list 'ac-modes 'pig-mode)
(add-to-list 'ac-modes 'go-mode)
(add-to-list 'ac-modes 'R-mode)
(add-to-list 'ac-modes 'java-mode)
(add-to-list 'ac-modes 'shell-mode)
(add-to-list 'ac-modes 'emacs-lisp)
(add-to-list 'ac-modes 'php-mode)

;; Pig mode
(add-to-list 'load-path "~/.emacs.d/plugins/pig-mode")
(require 'pig-mode)

;; YAML mode
(add-to-list 'load-path "~/.emacs.d/plugins/yaml-mode")
(require 'yaml-mode)
(add-hook 'yaml-mode-hook
    (lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; Using the ESS (emacs speaks statistics) package
(add-to-list 'load-path "~/.emacs.d/plugins/ess/lisp")
(require 'ess-site)

;; Other ESS bits
(setq ess-eval-visibly-p nil) ;otherwise C-c C-r (eval region) takes forever
(setq ess-ask-for-ess-directory nil) ;otherwise you are prompted each time you start an interactive R session

;; Keybinding for the MagritteR pipe '%>%'
(define-key ess-mode-map [(super .)] "%>%")

;; Python stuff
(setq py-install-directory "~/.emacs.d/plugins/python-mode/")
(add-to-list 'load-path "~/.emacs.d/plugins/python-mode/")
(require 'python-mode)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(require 'ipython)
(setq py-python-command-args '("--colors" "Linux"))

;; Python hook
(add-hook 'python-mode-hook
          (function (lambda()
                      (setq intent-tabs-mode nil
                            tab-width 4))))

;; Electric Pairs
(add-hook 'python-mode-hook
     (lambda ()
      (define-key python-mode-map "\"" 'electric-pair)
      (define-key python-mode-map "\'" 'electric-pair)
      (define-key python-mode-map "(" 'electric-pair)
      (define-key python-mode-map "[" 'electric-pair)
      (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

;;; bind RET to py-newline-and-indent
(add-hook 'python-mode-hook '(lambda () 
     (define-key python-mode-map "\C-m" 'newline-and-indent)))

;; Using the color-theme package
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0/")
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
(require 'color-theme-subdued)
;; This is the theme I use
(color-theme-subdued)

;; "I always compile my .emacs, saves me about two seconds
;; startuptime. But that only helps if the .emacs.elc is newer
;; than the .emacs. So compile .emacs if it's not."
(defun autocompile nil
  "compile itself if ~/.emacs"
  (interactive)
  (require 'bytecomp)
  (if (string= (buffer-file-name) (expand-file-name (concat
default-directory ".emacs")))
      (byte-compile-file (buffer-file-name))))

(add-hook 'after-save-hook 'autocompile)

; disable the pesky toolbar and menu
(tool-bar-mode -1)
(menu-bar-mode -1)

; turn on syntax coloring
(global-font-lock-mode 1)

; always highlight matched parens
(show-paren-mode 1)

; display line numbers in margin (fringe). Emacs 23 only.
(global-linum-mode 1)
(setq linum-format "%d ")

; word-wrapping is on by default
(global-visual-line-mode 1) ; 1 for on, 0 for off.

; Make the default major mode text mode
(setq default-major-mode 'text-mode)
(setq initial-major-mode 'text-mode)

; Set tab-width to 4 and don't do weird indenting
(setq-default indent-tabs-mode nil)
(setq-default tab-always-indent nil)
(setq-default tab-width 4)
(setq-default standard-indent 4)

(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

(define-key text-mode-map (kbd "TAB") 'tab-to-tab-stop);

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ))
