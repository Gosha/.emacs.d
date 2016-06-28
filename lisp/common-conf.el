; I want spaces for indentation
(setq-default indent-tabs-mode nil)

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

;; Undo window modifications with C-c <left/right>
(winner-mode 1)

;; Tramp for ssh:// sudo:/ and the like
(require 'tramp)
;; ??? utf-8 support or something
(require 'iso-transl)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

;; IDO
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Display ido results vertically, rather than horizontally
(setq ido-decorations
      (quote ("\n-> "
              ""
              "\n   "
              "\n   ..."
              "["
              "]"
              " [No match]"
              " [Matched]"
              " [Not readable]"
              " [Too big]"
              " [Confirm]")))

(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))

;; TODO: Move?
;(eval-after-load "cc-mode"
;  (define-key c-mode-base-map (kbd "RET") 'newline-and-indent))

(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

;; Change all yes-or-no-p to y-or-n-p
(defalias 'yes-or-no-p 'y-or-n-p)

;; Define bigger faces for org
;; could also use (((graphics t))) I think, I dunno
;; Currently they're inherited in custom.el or something
(defface bigger-org-levels
  '((t :height 1.5))
  "Make dem org outline levels slighlty bigger on X")

(provide 'common-conf)
