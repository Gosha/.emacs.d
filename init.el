;; Custom files in another folder (I don't remember why)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Don't show the silly start screen
(setq inhibit-startup-screen t)

;; Show matching parens
(show-paren-mode t)

;; Delete marked region when typing
(pending-delete-mode t)

;; I don't use double spaces at the end of a sentence
(setq sentence-end-double-space nil)

(setq password-cache-expiry nil) ; ?? Probably tramp

;; Damn warnings
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-defun  'disabled nil)
(put 'narrow-to-page   'disabled nil)
(put 'upcase-region    'disabled nil)


(setq scroll-conservatively 5) ; Scroll more smoothly
(setq scroll-margin 0)         ; Start scrolling when pointer approaches the edge
(setq scroll-error-top-bottom 'true) ; Don't signal an error when trying to scroll to beggining or end of buffer

; I want spaces for indentation
(setq-default indent-tabs-mode nil)

;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)

;; No Tool bar, but I kind of like the other bars
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;;; Org-mode
;; Use Monday as starting day when picking a date in calendar
(setq calendar-week-start-day 1)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; I want spaces for indentation
; (setq-default indent-tabs-mode nil)

;; Undo window modifications with C-c <left/right>
(winner-mode 1)

;; Pretty lambda
(font-lock-add-keywords 'emacs-lisp-mode
  '(("(\\(lambda\\)\\>" (0 (prog1 ()
                             (compose-region (match-beginning 1)
                                             (match-end 1)
                                             ?λ))))))
;; Tramp for ssh:// sudo:/ and the like
(require 'tramp)
;; ??? utf-8 support or something
(require 'iso-transl)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

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
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(add-to-list 'el-get-recipe-path "~/.emacs.d/user-recipes")

(setq el-get-sources
      '(
        ;(:name color-theme-almost-monokai
        ; :after ;(color-theme-almost-monokai))
        ; )
	(:name ace-jump-mode
	 :after (progn
		  (define-key global-map (kbd "C-Q") 'ace-jump-word-mode)))
	(:name ido-ubiquitous
	 :after (ido-ubiquitous-mode t))

        (:name buffer-move
          :after (progn
                   (global-set-key (kbd "<C-S-up>") 'buf-move-up)
                   (global-set-key (kbd "<C-S-down>") 'buf-move-down)
                   (global-set-key (kbd "<C-S-left>") 'buf-move-left)
                   (global-set-key (kbd "<C-S-right>") 'buf-move-right)))

	(:name undo-tree
	 :after (global-set-key (kbd "C-z") 'undo))

	(:name magit
	 :after (global-set-key (kbd "<f12>") 'magit-status))

	(:name lua-block
	 :after (progn
		  (require 'lua-block)
		  (lua-block-mode t)))

	(:name dired-details
	 :after (progn
		  (setq-default dired-details-hidden-string "--- ")
		  (dired-details-install)))

        (:name flx
         :after (progn
                  (ido-everywhere 1)
                  (flx-ido-mode 1)))

        (:name smex
         :after (progn
                  (global-set-key (kbd "M-x") 'smex)
                  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
                  ;; This is your old M-x.
                  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))
        (:name auctex
         :after (setq TeX-PDF-mode t))
        (:name smartscan
         :after (global-smartscan-mode 1))
        (:name mmm-mode
         :after (progn
                  (require 'mmm-mode)
                  (setq mmm-global-mode 'maybe)
                  (dolist (item '("\\.phtml\\'" "\\.php[s34]?\\'"))
                    (add-to-list
                     'auto-mode-alist
                     (cons item 'html-mode))
                    (mmm-add-mode-ext-class
                     'html-mode item 'html-php))))
        (:name flycheck
         :after (progn
                  (add-hook 'c-mode-hook 'flycheck-mode)))
        (:name web-mode
         :after (dolist (item '("\\.html?" "\\.phtml\\'" "\\.php[s34]?\\'"))
                  (add-to-list
                   'auto-mode-alist
                   (cons item 'web-mode))))
        (:name guide-key
         :after (progn
                  (setq guide-key/guide-key-sequence '("C-x" "C-c"))
                  (setq guide-key/recursive-key-sequence-flag t)
                  (guide-key-mode 1)))
        (:name company-mode
         :after (progn
                  (add-hook 'after-init-hook 'global-company-mode)))
        (:name company-c-headers
         :after (progn
                  (add-hook 'company-mode-hook
                            (lambda ()
                              (add-to-list 'company-backends 'company-c-headers)))))
        (:name workgroups
         :after (progn
                  (setq wg-prefix-key (kbd "C-c w"))
                  (workgroups-mode 1)))
	))

(setq my-packages
      (append
       '(el-get
         lua-mode
         markdown-mode
         php-mode-improved
         color-theme-solarized
         ;; clojure-mode
         ;; nrepl                       ; Requires epl
         ;; skewer-mode                 ; Provides live interaction with JavaScript,
                                        ; CSS, and HTML in a web browser
         ;; csharp-mode
         smartscan
         indent-guide                   ; Show current indentation graphically
                                        ; (indent-guide-mode)
         ;; haskell-mode
         yaml-mode
         apache-mode
         iedit
         ibuffer-vc
         )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get-cleanup my-packages)
(el-get 'sync my-packages)

(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))

(load-theme 'solarized-dark t)

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list '("Make" "make" TeX-run-TeX nil t)))

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
