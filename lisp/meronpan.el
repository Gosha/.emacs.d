(add-el-get-sources
 '(
   (:name lua-block
    :after (progn
             (require 'lua-block)
             (lua-block-mode t)))

   (:name auctex
    :after (setq TeX-PDF-mode t))
   (:name mmm-mode
    :after (progn
             (require 'mmm-mode)
             (setq mmm-global-mode 'maybe)
             (dolist (item '(html-php html-css html-js))
               (mmm-add-mode-ext-class
                'html-mode nil item))))
   (:name guide-key
    :after (progn
             (setq guide-key/guide-key-sequence '("C-x" "C-c"))
             (setq guide-key/recursive-key-sequence-flag t)
             (guide-key-mode 1)))
   ;; (:name flycheck
   ;;  :after (progn
   ;;           (add-hook 'c-mode-hook 'flycheck-mode)))
   (:name neotree
    :after (global-set-key [f8] 'neotree-toggle))
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
   (:name eclim
    :after (progn
             ;; TODO : make it load only when company is loaded
             (add-hook 'eclim-mode-hook
                       (lambda ()
                         (require 'company-emacs-eclim)
                         (company-emacs-eclim-setup)))))
   ))

(add-el-get-packages 
 '(
   lua-mode
   php-mode-improved
   indent-guide                   ; Show current indentation
                                  ; graphically (indent-guide-mode)
   ;; clojure-mode
   ;; nrepl                       ; Requires epl
   ;; skewer-mode                 ; Provides live interaction with JavaScript,
                                  ; CSS, and HTML in a web browser
   ;; csharp-mode
   ;; haskell-mode
   yaml-mode
   ;; kuromoji
   pymacs
   ;; ropemacs
   ropemacs3
   ))

(eval-after-load "tex"
  '(add-to-list 'TeX-command-list '("Make" "make" TeX-run-TeX nil t)))

;; Pretty lambda
(font-lock-add-keywords 'emacs-lisp-mode
                        '(("(\\(lambda\\)\\>" (0 (prog1 ()
                                              (compose-region (match-beginning 1)
                                                              (match-end 1)
                                                              ?λ))))))

;; (pymacs-load "ropemacs" "rope-")


(provide 'meronpan)
