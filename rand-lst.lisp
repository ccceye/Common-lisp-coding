
(defun rand-lst (lst)
  "递归版本：输入一个列表，返回一个随机排列的列表"
  (if (null lst)
      nil
      (let ((r-l (nth (random (length lst)) lst)))
	(cons r-l (rand-lst (remove r-l lst)))))) 


2(defvar *l* '("aa" "bb" "cc" "dd" "ee"))
(format t "~% 原始列表：  ~a " *l*)
(format t "~% 返回的列表：~a ~%" (rand-lst *l*)) 
