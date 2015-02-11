;;load-path就同bash中的$PATH相似，emacs所需要的Elisp包都得在load-path里的文件夹中
(setq load-path (cons "~/.emacs.d/" load-path))

;;;;设置emacs中打开url的工具是chromium，如果是其他浏览器那么替换掉名称
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium-browser")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command "markdown_py"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq window-system-default-frame-alist
      '(
        ;; if frame created on x display
        (x
	  ;(menu-bar-lines . 1)
	   (tool-bar-lines . nil)
	    ;; mouse
	    (mouse-wheel-mode . 1)
	     (mouse-wheel-follow-mouse . t)
	      (mouse-avoidance-mode . 'exile)
	       ;; face
	       (font . "文泉驿等宽微米黑 16")
	        )
        ;; if on term
        (nil
	  (menu-bar-lines . 0) (tool-bar-lines . 0)
	   ;; (background-color . "black")
	   ;; (foreground-color . "white")
	   )
	)
      )

(if (display-graphic-p)
 (set-fontset-font (frame-parameter nil 'font) 'unicode (eval "文泉驿等宽微米黑 16"))
)

(load "basic");;基本配置
(load "coding");;编程用配置
(load "taosteel");;淘钢工作用配置

;;必须放在最后,可以保存上次d关闭时的状态，下次启动时恢复状态。
(load "desktop")
(desktop-save-mode 1)
;;(server-start) 
(put 'dired-find-alternate-file 'disabled nil)
