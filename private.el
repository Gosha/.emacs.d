;; This is your private configuration file. It is loaded automatically, so feel free to add whatever you want.
;; This file will not be affected by Castlemacs updates.


(setq git-gutter:added-sign "|")

;;; Install fsharp-mode
(use-package fsharp-mode)

;; sUse Monday as starting day when picking a date in calendar
(setq calendar-week-start-day 1)

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(require 'dired-x)

(use-package ace-jump-mode
  :config
  (global-set-key (kbd "C-q") 'ace-jump-mode)
  (global-set-key (kbd "C-c w") 'ace-jump-mode-pop-mark)
  (global-set-key (kbd "C-c q") 'ace-jump-char-mode))

(use-package smartscan) ;; Go to next occurence of word, M-n/M-p
;(use-package indent-guide)
(use-package ibuffer-vc)
(use-package restclient)

;; Handle windows
(global-set-key (kbd "M-0") 'delete-window) ; close current pane
(global-set-key (kbd "M-1") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-2") 'split-window-vertically) ; split pane top/bottom
(global-set-key (kbd "M-3") 'split-window-horizontally) ; split pane left/right
(global-set-key (kbd "M-s") 'other-window) ; cursor to other pane

(global-set-key (kbd "C-c C-q")  'quoted-insert) ;; Read next input character and insert it.

(global-set-key (kbd "M-SPC") 'set-mark-command)

(global-set-key (kbd "C-x C-b") 'ibuffer) ; Show lscpretty list of buffers

;; Lambda symbol for elisp lambdas
(font-lock-add-keywords
  'emacs-lisp-mode
  '(("(\\(lambda\\)\\>" (0 (prog1 ()
                             (compose-region (match-beginning 1)
                                             (match-end 1)
                                             ?λ))))))

;; (font-lock-add-keywords
;;   'fsharp-mode
;;   '(("(\\(fun\\)\\>" (0 (prog1 ()
;;                           (compose-region (match-beginning 1)
;;                                           (match-end 1)
;;                                           ?λ))))))

;; Change background color of active window
(defun highlight-selected-window ()
  "Highlight selected window with a different background color."
  (walk-windows (lambda (w)
                  (unless (eq w (selected-window))
                    (with-current-buffer (window-buffer w)
                      (buffer-face-set '(:background "#555"))))))
  (buffer-face-set 'default))
(add-hook 'buffer-list-update-hook 'highlight-selected-window)

(setq ivy-height 20)

(defun save-and-recompile ()
  (interactive)
  (save-buffer)
  (recompile))

(global-set-key (kbd "C-c g") 'save-and-recompile)

(use-package mmm-mode)
(mmm-add-classes
 '((fsx-markdown
    :submode markdown-mode
    :delimiter-mode nil
    :front "\\*\\*\\\n?"
    :back "\*)")))
(mmm-add-mode-ext-class 'fsharp-mode nil 'fsx-markdown)

(use-package dockerfile-mode)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(require 'lsp-mode)
(add-hook 'elm-mode-hook #'lsp)
