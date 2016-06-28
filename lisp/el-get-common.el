(require 'el-get-conf)

(add-el-get-sources
 '(
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
         :after (progn
                  (autoload 'magit-status "magit")
                  (global-set-key (kbd "<f12>") 'magit-status)))
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
        (:name smartscan
         :after (global-smartscan-mode 1))
        (:name web-mode
         :after (dolist (item '("\\.html?" "\\.phtml\\'" "\\.php[s34]?\\'"))
                  (add-to-list
                   'auto-mode-alist
                   (cons item 'web-mode))))
        (:name base16
               :after (load-theme 'base16-eighties-dark t))
   ))

(add-el-get-packages
 '(
   el-get
   markdown-mode
   smartscan
   apache-mode
   iedit
   ibuffer-vc
   muttrc-mode
   any-ini-mode
   ))

(provide 'el-get-common)
