(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-charcoal-black)))

(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(autoload 'ruby-mode "ruby-mode" "Major mode for editing Ruby code" t)
(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))

(require 'inf-ruby)

(require 'ruby-electric)
(add-hook 'ruby-mode-hook
	  (lambda ()
	    (ruby-electric-mode t)))

(setq rsense-home "/usr/local/rsense")
(require 'rsense)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins//ac-dict")
(ac-config-default)

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c .") 'ac-complete-rsense)
	    (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

;;mode-compile
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

(require 'rdebug)

(require 'tabbar)
(tabbar-mode)

(global-set-key (kbd "s-4") 'tabbar-backward-group)
(global-set-key (kbd "s-5") 'tabbar-forward-group)
(global-set-key (kbd "s-2") 'tabbar-backward)
(global-set-key (kbd "s-3") 'tabbar-forward)
