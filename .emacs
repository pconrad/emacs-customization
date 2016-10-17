;;; XEmacs backwards compatibility file


(defun ABET-redaction-insert ()
  "Insert [Redacted for ABET] at cursor point."
  (interactive)
  (insert "[Redacted for ABET]")
  (backward-char 19))

(global-set-key (kbd "C-x t") 'ABET-redaction-insert)

(global-set-key "\M-q" 'fill-paragraph)

; READ THIS LATER: http://stackoverflow.com/questions/9472254/setting-emacs-24-color-theme-from-emacs

(add-to-list 'default-frame-alist '(background-color . "white"))

(global-set-key "\M-q" 'fill-paragraph)



(setq user-init-file
      (expand-file-name "init.el"
			(expand-file-name ".xemacs" "~")))
(setq custom-file
      (expand-file-name "custom.el"
			(expand-file-name ".xemacs" "~")))



(add-to-list 'load-path "~/emacs-code/color-theme" )

(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-resolve)))


 (require 'color-theme)
  (setq my-color-themes (list 
			 'color-theme-resolve
			 'color-theme-jsc-dark 
			 'color-theme-billw 
			 'color-theme-hober 
			 'color-theme-sitaramv-solaris 
			 'color-theme-classic 
			 'color-theme-jonadabian-slate
			 'color-theme-kingsajz 
			 'color-theme-shaman
			 'color-theme-subtle-blue 
			 'color-theme-snowish
			 'color-theme-sitaramv-nt 
			 'color-theme-wheat
			 ))

 (defun my-theme-set-default () ; Set the first row
      (interactive)
      (setq theme-current my-color-themes)
      (funcall (car theme-current)))
     
    (defun my-describe-theme () ; Show the current theme
      (interactive)
      (message "%s" (car theme-current)))
     
   ; Set the next theme (fixed by Chris Webber - tanks)
(defun my-theme-cycle ()
      (interactive)
      (setq theme-current (cdr theme-current))
      (if (null theme-current)
      (setq theme-current my-color-themes))
      (funcall (car theme-current))
      (message "%S" (car theme-current)))
    
    (setq theme-current my-color-themes)
    (setq color-theme-is-global nil) ; Initialization
    (my-theme-set-default)
    (global-set-key [f12] 'my-theme-cycle)
    (global-set-key (kbd "C-x 9") 'my-theme-cycle)


;; disable color crap
(setq-default global-font-lock-mode nil)

(load-file user-init-file)
(load-file custom-file)
