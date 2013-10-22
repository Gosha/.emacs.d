;; Custom files in another folder (I don't remember why)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Don't show the silly start screen
(setq inhibit-startup-screen t)

;; Show matching parens
(show-paren-mode t)

;; Delete marked region when typing
(pending-delete-mode t)

(setq password-cache-expiry nil) ; ?? Probably tramp

;; Damn warning
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(setq scroll-conservatively 5) ; Scroll more smoothly
(setq scroll-margin 0)         ; Start scrolling when pointer approaches the edge
(setq scroll-error-top-bottom 'true) ; Don't signal an error when trying to scroll to beggining or end of buffer

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
		  (define-key global-map (kbd "C-Q") 'ace-jump-char-mode)))
	(:name ido-ubiquitous
	 :after (ido-ubiquitous-mode t))

	(:name undo-tree
	 :after (global-set-key (kbd "C-z") 'undo))

	(:name magit
	 :after (global-set-key (kbd "<f12>") 'magit-status))

	(:name lua-block
	 :after (progn
		  (require 'lua-block)
		  (lua-block-mode t)))
	))

(setq my-packages
      (append
       '(el-get lua-mode)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get-cleanup my-packages)
(el-get 'sync my-packages)
