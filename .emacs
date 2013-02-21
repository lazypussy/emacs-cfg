
;;;display time
(display-time)

;;c-mode TAB
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

;;;
(setq load-path (cons "~/sl-emacs" load-path))


;;; load key-diy file
(if (file-exists-p "~/.emacs.d/.emacs-key-cfg.el")
    (load "~/.emacs.d/.emacs-key-cfg.el"))

;;;sbcl & slime
(if (file-exists-p "~/.emacs.d/.sbcl-slime-cfg.el")
    (load "~/.emacs.d/.sbcl-slime-cfg.el"))

;;; make emacs like Source Insight
(if (file-exists-p "~/.emacs.d/.si-like-cfg.el")
    (load "~/.emacs.d/.si-like-cfg.el"))

;;;el-get
;(if (file-exists-p "~/.emacs.d/.el-get-cfg.el")
;    (load "~/.emacs.d/.el-get-cfg.el"))

;;;erlang environment config
(if (file-exists-p "~/.emacs.d/.erl5.10.el")
    (load "~/.emacs.d/.erl5.10.el"))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.32")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(session-use-package t nil (session)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;RST
;(require 'rst)
;(add-hook 'text-mode-hook 'rst-text-mode-bindings)
 
;(setq auto-mode-alist
;(append '(("\\.rst$" . rst-mode)
;("\\.rest$" . rst-mode)) auto-mode-alist))

