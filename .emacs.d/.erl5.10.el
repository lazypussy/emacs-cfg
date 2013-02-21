;; Erlang mode
(setq load-path (cons  "D:/erl5.10/lib/tools-2.6.9/emacs" load-path))
(setq erlang-root-dir "D:/erl5.10")
(setq exec-path (cons "D:/erl5.10/bin" exec-path))
(require 'erlang-start)

 

;; Distel
(let ((distel-dir "G:/works/distel/elisp"))
  (unless (member distel-dir load-path)
    (setq load-path (append load-path (list distel-dir)))))
(require 'distel)
(distel-setup)

 

;; Some Erlang customizations
(add-hook 'erlang-mode-hook
  (lambda ()
  ;; when starting an Erlang shell in Emacs, default in the node name
    (setq inferior-erlang-machine-options '("-sname" "emacs"))
    ;; add Erlang functions to an imenu menu
    (imenu-add-to-menubar "imenu")))
;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("/C-/M-i"   erl-complete)
    ("/M-?"      erl-complete) 
    ("/M-."      erl-find-source-under-point)
    ("/M-,"      erl-find-source-unwind) 
    ("/M-*"      erl-find-source-unwind) 
    )
  "Additional keys to bind when in Erlang shell.")
(add-hook 'erlang-shell-mode-hook
   (lambda ()
     ;; add some Distel bindings to the Erlang shell
     (dolist (spec distel-shell-keys)
       (define-key erlang-shell-mode-map (car spec) (cadr spec)))))