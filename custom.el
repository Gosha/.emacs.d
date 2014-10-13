(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-trigger-key "TAB")
 '(ac-use-fuzzy t)
 '(auto-indent-next-pair-timer-geo-mean (quote ((default 0.0005 0))))
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(diff-switches "-u")
 '(dired-dwim-target t)
 '(eclim-eclipse-dirs (quote ("/home/gosha/make/eclipse" "/Applications/eclipse" "/usr/lib/eclipse" "/usr/local/lib/eclipse" "/usr/share/eclipse")))
 '(eclim-executable "/home/gosha/make/eclipse/eclim")
 '(safe-local-variable-values (quote ((subword-mode . t) (company-clang-arguments "-I/usr/include/gtk-3.0" "-I/usr/include/at-spi2-atk/2.0" "-I/usr/include/gtk-3.0" "-I/usr/include/gio-unix-2.0/" "-I/usr/include/cairo" "-I/usr/include/pango-1.0" "-I/usr/include/harfbuzz" "-I/usr/include/pango-1.0" "-I/usr/include/atk-1.0" "-I/usr/include/cairo" "-I/usr/include/pixman-1" "-I/usr/include/freetype2" "-I/usr/include/libpng16" "-I/usr/include/freetype2" "-I/usr/include/libdrm" "-I/usr/include/gdk-pixbuf-2.0" "-I/usr/include/libpng16" "-I/usr/include/glib-2.0" "-I/usr/lib64/glib-2.0/include") (eval progn (make-local-variable (quote company-c-headers-path-system)) (dolist (item (quote ("/usr/include/gtk-3.0" "/usr/include/at-spi2-atk/2.0" "/usr/include/gtk-3.0" "/usr/include/gio-unix-2.0/" "/usr/include/cairo" "/usr/include/pango-1.0" "/usr/include/harfbuzz" "/usr/include/pango-1.0" "/usr/include/atk-1.0" "/usr/include/cairo" "/usr/include/pixman-1" "/usr/include/freetype2" "/usr/include/libpng16" "/usr/include/freetype2" "/usr/include/libdrm" "/usr/include/gdk-pixbuf-2.0" "/usr/include/libpng16" "/usr/include/glib-2.0" "/usr/lib64/glib-2.0/include"))) (add-to-list (quote company-c-headers-path-system) item))) (c-default-style . "bsd") (whitespace-style face tabs trailing lines-tail) (eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook" (add-hook (quote write-contents-functions) (lambda nil (delete-trailing-whitespace) nil)) (require (quote whitespace)) "Sometimes the mode needs to be toggled off and on." (whitespace-mode 0) (whitespace-mode 1)) (whitespace-line-column . 80) (whitespace-style face trailing lines-tail) (require-final-newline . t))))
 '(wg-morph-hsteps 40)
 '(wg-morph-vsteps 40))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "xos4" :family "Terminus"))))
 '(flymake-errline ((((class color)) (:underline "red"))) t)
 '(flymake-warnline ((((class color)) (:underline "yellow"))) t)
 '(flyspell-duplicate ((t (:inherit unspecified :foreground "default" :underline "chocolate3"))) t)
 '(flyspell-incorrect ((t (:inherit unspecified :foreground "default" :underline "firebrick"))) t)
 '(web-mode-html-tag-custom-face ((t (:foreground "Snow4"))) t)
 '(web-mode-html-tag-face ((t (:inherit font-lock-variable-name-face))) t)
 '(wg-divider-face ((t (:foreground "light sky blue")))))
; '(flymake-errline ((((class color)) (:underline "red"))) t)
; '(flymake-warnline ((((class color)) (:underline "yellow"))) t)

