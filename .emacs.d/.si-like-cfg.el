;;;;; 会话 浏览 cscope ... ...

;;;; ibuffer+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;(require 'ibuffer)  ;;emacs 22 后自带了ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
    (autoload 'ibuffer "ibuffer" "List buffers." t)

;;;; desktop+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(load "desktop") 
(desktop-load-default) 
(desktop-read)

;;;; session+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(add-to-list 'load-path "~/sl-emacs/session")
(require 'session) ;;加载session
(add-hook 'after-init-hook 'session-initialize) ;; 启动时初始化session


;;;;cedet-semantic+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;; 具体说明可参考源码包下的INSTALL文件，或《A Gentle introduction to Cedet》
(add-to-list 'load-path "~/sl-emacs/cedet-1.1/common")
(require 'cedet) ;;加载cedet

;;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:
;(semantic-load-enable-minimum-features)
;(semantic-load-enable-code-helpers)
;(semantic-load-enable-gaudy-code-helpers)
(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)
 
;;; 使函数体能够折叠或展开
;; Enable source code folding
(global-semantic-tag-folding-mode 1)
;;; Key bindings
(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol) ; 自动补全
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-cd" 'semantic-ia-fast-jump)
  (local-set-key "\C-cr" 'semantic-symref-symbol)
  (local-set-key "\C-cR" 'semantic-symref))
(add-hook 'c-mode-common-hook 'my-cedet-hook)
;;; 当输入"."或">"时，在另一个窗口中列出结构体或类的成员
(defun my-c-mode-cedet-hook ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)
;;;自动补齐策略
(defun my-indent-or-complete ()
   (interactive)
   (if (looking-at "//>")
          (hippie-expand nil)
          (indent-for-tab-command))
)
 
(global-set-key [(control tab)] 'my-indent-or-complete)
 
(autoload 'senator-try-expand-semantic "senator")
(setq hippie-expand-try-functions-list
          '(
              senator-try-expand-semantic
                   try-expand-dabbrev
                   try-expand-dabbrev-visible
                   try-expand-dabbrev-all-buffers
                   try-expand-dabbrev-from-kill
                   try-expand-list
                   try-expand-list-all-buffers
                   try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
)

;;;;ecb++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(add-to-list 'load-path "~/sl-emacs/ecb-2.32")
(require 'ecb) ;;加载ecb

;;; 自动启动ecb，并且不显示每日提示
(setq ecb-auto-activate t
      ecb-tip-of-the-day nil)
;;; 各窗口间切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)
;;; 隐藏和显示ecb窗口
(define-key global-map [(control f1)] 'ecb-hide-ecb-windows)
(define-key global-map [(control f2)] 'ecb-show-ecb-windows)
;;; 使某一ecb窗口最大化
(define-key global-map "\C-c1" 'ecb-maximize-window-directories)
(define-key global-map "\C-c2" 'ecb-maximize-window-sources)
(define-key global-map "\C-c3" 'ecb-maximize-window-methods)
(define-key global-map "\C-c4" 'ecb-maximize-window-history)
;;; 恢复原始窗口布局
(define-key global-map "\C-c`" 'ecb-restore-default-window-sizes)

;;;;cscope+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;(add-to-list 'load-path "~/sl-emacs/cscope-15.8a")
;(require 'xcscope) ;;加载xcscope
;;c模式下加载xcscope 
(add-hook 'c-mode-common-hook '(lambda() (require 'xcscope)))
;;;绑定按键
(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(control f5)]  'cscope-find-this-symbol)
(define-key global-map [(control f6)]  'cscope-find-global-definition)
(define-key global-map [(control f7)]  'cscope-find-global-definition-no-prompting)
(define-key global-map [(control f8)]  'cscope-pop-mark)
(define-key global-map [(control f9)]  'cscope-next-symbol)
(define-key global-map [(control f10)] 'cscope-next-file)
(define-key global-map [(control f11)] 'cscope-prev-symbol)
(define-key global-map [(control f12)] 'cscope-prev-file)
(define-key global-map [(meta f9)]     'cscope-display-buffer)
(define-key global-map [(meta f10)]    'cscope-display-buffer-toggle)
;;关闭每次查找时自动更新cscope.out
(setq cscope-do-not-update-database t)

