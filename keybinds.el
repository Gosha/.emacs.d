;; Easy navigation between windows
;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(global-set-key (kbd "<M-S-left>")  'windmove-left)
(global-set-key (kbd "<M-S-right>") 'windmove-right)
(global-set-key (kbd "<M-S-up>")    'windmove-up)
(global-set-key (kbd "<M-S-down>")  'windmove-down)

;; Wow, fuck you org-mode
(global-set-key (kbd "<C-M-S-left>")  'windmove-left)
(global-set-key (kbd "<C-M-S-right>") 'windmove-right)
(global-set-key (kbd "<C-M-S-up>")    'windmove-up)
(global-set-key (kbd "<C-M-S-down>")  'windmove-down)


;; revert-buffer without confirmation on
(global-set-key (kbd "C-ö r")
                (lambda ()
                  (interactive)
                  (revert-buffer nil t)))

;; easy keys to split window. Key based on ErgoEmacs keybinding
(global-set-key (kbd "C-!") 'delete-other-windows) ; Show only current buffer (C-S-1)
(global-set-key (kbd "M-3") 'split-window-horizontally) ; split pane left/right
(global-set-key (kbd "M-2") 'split-window-vertically) ; split pane top/bottom
(global-set-key (kbd "M-4") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-s") 'other-window) ; cursor to other pane
(global-set-key (kbd "M-0") 'delete-window) ; close current pane

(global-set-key (kbd "C-x C-b") 'ibuffer) ; Show pretty list of buffers

(global-set-key (kbd "<backtab>") 'dabbrev-expand)

;; From defuns.el
(global-set-key (kbd "<C-S-down>") 'move-line-down)
(global-set-key (kbd "<C-S-up>") 'move-line-up)

(global-set-key (kbd "<f11>") 'recompile)

(provide 'keybinds)
