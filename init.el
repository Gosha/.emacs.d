;; Load more custom files
(add-to-list 'load-path user-emacs-directory)

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
