;;golang 配置
(add-to-list 'load-path (concat (getenv "GOROOT") "/misc/emacs"))
(require 'go-mode-load)

;;yasnippet tab complete like textmate snippets  
;(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0")
;(require 'yasnippet)
;(yas-global-mode 1)

;; To use graphviz-dot-mode, add 
(load-file "~/.emacs.d/graphviz-dot-mode.el")
;(require 'graphviz-dot-mode)
;(graphviz-dot-mode 1)


(autoload 'markdown-mode "markdown-mode"
	"Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'". markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'". markdown-mode))

(add-to-list 'load-path "/home/rain/.emacs.d/ess-13.09-1/lisp/")
(require 'ess-site)

;;;; This snippet enables lua-mode
;; This line is not necessary, if lua-mode.el is already on your load-path
;;(add-to-list 'load-path "/path/to/directory/where/lua-mode-el/resides")

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;;;设置multi-term mode
(require 'multi-term) ;el文件下载拷贝好
(setq multi-term-program "/usr/bin/zsh") ;使用zsh
(setq multi-term-buffer-name "term") ;缩短buffer名字长度
(global-set-key "\C-x." 'multi-term) ;ctrl+x+.
(global-set-key "\C-x," 'multi-term-dedicated-open);ctrl+x+,
(setq multi-term-dedicated-select-after-open-p t) ;开启新term窗口时焦点自动跳到新窗口

;;;;设置javascript
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

