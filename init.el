;; Custom files in another folder (I don't remember why)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Don't show the silly start screen
(setq inhibit-startup-screen t)

;; Show matching parens
(show-paren-mode t)

;; Delete marked region when typing
(pending-delete-mode t)

;; No Tool bar, but I kind of like the other bars
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; I want spaces for indentation
; (setq-default indent-tabs-mode nil)

;; Set up el-get
(add-to-list 'load-path
	     (expand-file-name "el-get/el-get/" user-emacs-directory))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(setq el-get-sources
      '((:name solarized-theme
	 :after (load-theme 'solarized-dark t))

	(:name ace-jump-mode
	 :after (progn
		  (define-key global-map (kbd "C-q") 'ace-jump-mode)
		  (define-key global-map (kbd "C-Q") 'ace-jump-char-mode)))))

(setq my-packages
      (append
       '(el-get magit)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get-cleanup my-packages)
(el-get 'sync my-packages)

;; Tramp for ssh:// sudo:/ and the like
(require 'tramp)
;; ??? utf-8 support or something
(require 'iso-transl)

;; Load more custom files
(add-to-list 'load-path user-emacs-directory)
(require 'defuns)
(require 'keybinds)

;; IDO
(ido-mode t)
(setq ido-enable-flex-matching t)
