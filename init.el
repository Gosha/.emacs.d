;; Custom files in another folder (I don't remember why)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Don't show the silly start screen
(inhibit-startup-screen t)
