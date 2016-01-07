;; Load more custom files
(add-to-list 'load-path (concat user-emacs-directory "/lisp"))

(require 'defuns)
(require 'common-conf)
(require 'keybinds)
(require 'el-get-common)

(when (string-match-p
       "meronpan"
       system-name)
  (require 'meronpan)
  (do-el-get))

(when (string-match-p
       "meronpan\\|cookie"
       system-name)
  (do-el-get))

;; After el-gets
(when (string-match-p "cookie" system-name)
  (require 'cookie))
