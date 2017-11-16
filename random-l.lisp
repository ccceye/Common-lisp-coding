
(defun rand-list (list-in)
  "输入一个列表，随机排列后，再输出一个列表"
  (let ((x list-in) (y (make-list (length list-in))) (z (length list-in)))
    (dotimes (i z)
      (let ((j (random (- z i))))
	(setf (nth i y) (nth j x))
	(setq x (remove-if #'(lambda (a) (equal a (nth j x))) x))))
    y))

(defvar *l-n* '("东山" "城东" "城西" "盘东" "梅云" "仙桥" "榕东" "渔湖" "试验区"))
(format t "~%抽签前的次序是：~%~{~16t~a~%~}" *l-n*)
(format t "~%抽签后的顺序是：~%~{~16t~a~%~}" (rand-list *l-n*) )







  
