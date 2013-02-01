(add-to-list 'load-path "~/.emacs.d/conf")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-hook 'after-init-hook
	  '(lambda()
	     (mapc 'load (directory-files "~/.emacs.d/conf" t "^[a-zA-Z0-9].*.el$"))
	     (set-frame-size-and-position-initially)))


