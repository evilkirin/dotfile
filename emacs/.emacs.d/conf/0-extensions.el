(defun set-key-bindings (action bindingList)
  ""
  (mapcar (lambda(lst)
      ""
      (let ((x (car lst))
        (y (car (last lst))))
        (funcall action x y))) bindingList ))

(defun require-extensions (action lst)
  ""
  (mapcar (lambda (ext) "" (funcall action ext)) lst))

(defun set-frame-size-and-position-initially ()
  (interactive)
  (if window-system
      (progn
	(set-frame-size (selected-frame) 124 40)
	(set-frame-position (selected-frame) 0 0))))

(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))
