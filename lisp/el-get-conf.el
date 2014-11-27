;; Initial empty slate
(setq el-get-sources nil)
(setq my-packages nil)

(defun add-el-get-sources (sources)
  (cond
   ;; List of lists
   ((and (listp sources)
         (listp (car sources)))
    (dolist (item sources)
      (add-to-list 'el-get-sources item)))
   (t
    (add-to-list 'el-get-sources item))))

(defun add-el-get-packages (packages)
  (dolist (item packages)
    (add-to-list 'my-packages item)))

(defun do-el-get ()
  (setq my-packages
        (append
         my-packages
         (mapcar 'el-get-source-name el-get-sources)))
  (el-get-cleanup my-packages)
  (el-get 'sync my-packages))


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

(provide 'el-get-conf)
