(add-to-list 'load-path "D:/Program files/Steel Bank Common Lisp/1.0.55.7.mswinmt.1185-d20ec0c/")  
(add-to-list 'load-path "G:/slime/")  
(setq inferior-lisp-program "sbcl")  
(require 'slime-autoloads)

(slime-setup '(slime-fancy)) 
(put 'narrow-to-region 'disabled nil)

;;;quicklisp-slime-helper
(load (expand-file-name "C:/Documents and Settings/zhangyunrui/Application Data/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
  ;; (setq inferior-lisp-program "
