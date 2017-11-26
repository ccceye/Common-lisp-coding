;;;公共插件配置
;;因为package 是一个内置的插件，所以你不需要安装，要使用它你只需要告诉它仓库ELPA的位置即可.
;;设置package system，这里使用 MELPA，有非常多的插件（3000 多个插件)。添加源后，就可以使用 M-x package-list-packages 来查看所有 MELPA 上的插件了。在表单中可\\
以使用 I 来标记安装 D 来标记删除， U 来更新，并用 X 来确认并执行。
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;;以下为MELPA插件(packages)自动加入的:

;;;============================================================
;;;;快速打开配置文件
(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;;将函数绑到f2键
(global-set-key (kbd "<f2>") 'open-init-file)

;;;以下为MELPA插件(packages)自动加入的:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f\
8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544\
ddb2533a90101fd1852b426e" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "d5b121d69e48e0f2a84c8e4580f0ba230423391a78fcb4001ccb35d02494d79\
e" "7b4d9b8a6ada8e24ac9eecd057093b0572d7008dbd912328231d0cada776065a" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d7\
1f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(package-selected-packages
   (quote
    (color-theme-sanityinc-tomorrow slime-company company slime))))
    
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-bright t)

;;;Slime调用的lisp位置
(setq inferior-lisp-program "/usr/bin/sbcl")
;;closing parenthesis
;(global-set-key (kbd "\C-c \C-q") 'slime-close-all-parens-in-sexp


;;;开启complete anything mode
(global-company-mode t)
;(add-hook 'after-init-hook 'global-company-mode)

;;;slime-company: A company-mode completion backend for Slime
(slime-setup '(slime-fancy slime-company))
;;The following bindings for company-active-map will add the usual navigation keys to the completion menu:
;(define-key company-active-map (kbd "\C-n") 'company-select-next)
;(define-key company-active-map (kbd "\C-p") 'company-select-previous)
;(define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
;(define-key company-active-map (kbd "M-.") 'company-show-location)

;;显示行号
(global-linum-mode 1)
;;以 y/n 替代 yes/no
(fset 'yes-or-no-p 'y-or-n-p)
;;;;禁止自动生成备份文件
(setq make-backup-files nil)

;;;;启用自动括号匹配（Highlight Matching Parenthesis）
(add-hook 'emacs-lisp-mode-hook  'show-paren-mode)
;;;;高亮当前行，当文本内容很多时可以很容易找到光标的位置
;(global-hl-line-mode t)

;;;下面的配置,加入最近打开过文件的选项,可以更快捷(C-x C-r)的在图形界面的菜单中打开最近编辑过的文件
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-item 10)
(global-set-key  (kbd "C-x C-r")  'recentf-open-files)

;;-------------------设置lisp工作环境---------------------
(split-window-below)
(other-window 1)
(slime)
