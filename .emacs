;;set shift-space to 'set-mark-command
(global-set-key [?\S- ] 'set-mark-command)

;;;modify key
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)


;; ������������ģ��Vi�Ĺ�겻����Ļ��Ч��, �Һ�ϲ��, ��������ʹ��.
(global-set-key [(meta n)] 'window-move-up)        
(global-set-key [(meta p)] 'window-move-down)
;; ͬ��, ��������һ��buffer���������ƶ�. �����鿴���������.
(global-set-key [(control N)] 'other-window-move-down)
(global-set-key [(control P)] 'other-window-move-up)

;; ------------------------------�����������õ��ĺ�������------------------------------

(defun window-move-up (&optional arg)
  "Current window move-up 2 lines."
  (interactive "P")
  (if arg
      (scroll-up arg)
    (scroll-up 2)))

(defun window-move-down (&optional arg)
  "Current window move-down 3 lines."
  (interactive "P")
  (if arg
      (scroll-down arg)
    (scroll-down 3)))

(defun other-window-move-up (&optional arg)
  "Other window move-up 1 lines."
  (interactive "p")
  (scroll-other-window arg))

(defun other-window-move-down (&optional arg)
  "Other window move-down 2 lines."
  (interactive "P")
  (if arg
      (scroll-other-window-down arg)
    (scroll-other-window-down 2)))
