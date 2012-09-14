;;;;; �Ự ��� cscope ... ...

;;;; ibuffer+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;(require 'ibuffer)  ;;emacs 22 ���Դ���ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
    (autoload 'ibuffer "ibuffer" "List buffers." t)

;;;; desktop+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(load "desktop") 
(desktop-load-default) 
(desktop-read)

;;;; session+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(add-to-list 'load-path "~/sl-emacs/session")
(require 'session) ;;����session
(add-hook 'after-init-hook 'session-initialize) ;; ����ʱ��ʼ��session


;;;;cedet-semantic+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;; ����˵���ɲο�Դ����µ�INSTALL�ļ�����A Gentle introduction to Cedet��
(add-to-list 'load-path "~/sl-emacs/cedet-1.1/common")
(require 'cedet) ;;����cedet

;;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:
;(semantic-load-enable-minimum-features)
;(semantic-load-enable-code-helpers)
;(semantic-load-enable-gaudy-code-helpers)
(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)
 
;;; ʹ�������ܹ��۵���չ��
;; Enable source code folding
(global-semantic-tag-folding-mode 1)
;;; Key bindings
(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol) ; �Զ���ȫ
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-cd" 'semantic-ia-fast-jump)
  (local-set-key "\C-cr" 'semantic-symref-symbol)
  (local-set-key "\C-cR" 'semantic-symref))
(add-hook 'c-mode-common-hook 'my-cedet-hook)
;;; ������"."��">"ʱ������һ���������г��ṹ�����ĳ�Ա
(defun my-c-mode-cedet-hook ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)
;;;�Զ��������
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
(require 'ecb) ;;����ecb

;;; �Զ�����ecb�����Ҳ���ʾÿ����ʾ
(setq ecb-auto-activate t
      ecb-tip-of-the-day nil)
;;; �����ڼ��л�
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)
;;; ���غ���ʾecb����
(define-key global-map [(control f1)] 'ecb-hide-ecb-windows)
(define-key global-map [(control f2)] 'ecb-show-ecb-windows)
;;; ʹĳһecb�������
(define-key global-map "\C-c1" 'ecb-maximize-window-directories)
(define-key global-map "\C-c2" 'ecb-maximize-window-sources)
(define-key global-map "\C-c3" 'ecb-maximize-window-methods)
(define-key global-map "\C-c4" 'ecb-maximize-window-history)
;;; �ָ�ԭʼ���ڲ���
(define-key global-map "\C-c`" 'ecb-restore-default-window-sizes)

;;;;cscope+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;(add-to-list 'load-path "~/sl-emacs/cscope-15.8a")
;(require 'xcscope) ;;����xcscope
;;cģʽ�¼���xcscope 
(add-hook 'c-mode-common-hook '(lambda() (require 'xcscope)))
;;;�󶨰���
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
;;�ر�ÿ�β���ʱ�Զ�����cscope.out
(setq cscope-do-not-update-database t)

