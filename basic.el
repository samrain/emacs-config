;;;;color theme
;;使用M-x color-theme-select就可以选择配色方案
;;在配色方案上按I就可以改变当前frame的配色
;;按i就可以改变所有frame的配色
;;按p就可以把当前配色方案的lisp打印出来,加入你的.emacs，就可以不用加载color-theme了，这样可以加快起动速度
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-mistyday)
(load-file "~/.emacs.d/color-theme-rain.el")
(color-theme-rain)

;;;;中文字体设定－这里是一部分，还有.Xresources中也有
;; 我是近视眼，喜欢大字体。这个pixelsize大多数人是设成13吧。
 (set-frame-font "DejaVu Sans Mono:pixelsize=20")
  ;; 中文字体的设定，网上很多资料都是gb18030，但我的locale是UTF-8
 (set-fontset-font (frame-parameter nil 'font)
  'unicode '("WenQuanYi Bitmap Song" . "unicode-bmp"))

;;;;外观设置
;;版本24开始改为-1,以前是-1，有的说0，但是测试不行
(tool-bar-mode -1);;去掉工具栏
(menu-bar-mode -1);;去掉菜单栏，需要按F10
(scroll-bar-mode -1);;不要滚动栏

;;修改中文文本的行距,3个象素就可以了吧
(setq-default line-spacing 3)

;;linum 开启行号
;;(global-linum-mode 1)

;; 关闭启动画面  
(setq inhibit-startup-message 1)

;;备份设置
;;emacs还有一个自动保存功能，默认在~/.emacs.d/auto-save-list里，启用版本控制，即可以备份多次
(setq version-control t)
;;备份最原始的版本两次，记第一次编辑前的文档，和第二次编辑前的文档
(setq kept-old-versions 2)
;;备份最新的版本十次，理解同上
(setq kept-new-versions 10)
;;删掉不属于以上12中版本的版本
(setq delete-old-versions t)
;;设置备份文件的路径
(setq backup-directory-alist '(("." . "~/backup")))
;;备份设置方法，直接拷贝
(setq backup-by-copying 1)
(setq make-backup-file-name-function 1)

;;自动补全功能，从王垠的网站直接Copy过来的，引用一些他对此的说明
;;你可以设置以下 hippie-expand 的补全方式。它是一个优先列表， hippie-expand 会优
;;先使用表最前面的函数来补全这是说，首先使用当前的buffer补全，如果找不到，就到别的可见
;;的窗口里寻找，如果还找不到，那么到所有打开的buffer去找，如果还那么到kill-ring
;;里，到文件名，到简称列表里，到list, 当前使用的匹配方式会在 echo 区域显示。
;;特别有意思的是 try-expand-line，它可以帮你补全整整一行文字。我很多时后有两行文字大致
;;相同，只有几个字不一样，但是我懒得去拷贝粘贴以下。那么我就输入这行文字的前面几个字。然后
;;多按几下 M-/ 就能得到那一行。
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
  '(
 ;senator-try-expand-semantic ;优先调用了senator的分析结果-很慢-还是使用吧
  try-expand-line ; 补全当前行
  try-expand-line-all-buffers
  try-expand-list ; 补全一个列表
  try-expand-list-all-buffers
  try-expand-dabbrev ; 搜索当前 buffer
  try-expand-dabbrev-visible ; 搜索当前可见窗口
  try-expand-dabbrev-all-buffers ; 搜索所有 buffer
  try-expand-dabbrev-from-kill ; 从 kill-ring 中搜索
  try-complete-file-name ; 文件名匹配
  try-complete-file-name-partially ; 文件名部分匹配
  try-complete-lisp-symbol ; 补全 lisp symbol
  try-complete-lisp-symbol-partially ; 部分补全 elisp symbol
  try-expand-whole-kill
  )
  )

;;启用minibuffer，好像是默认设置吧
(minibuffer-electric-default-mode 1)
;;启用部分补全功能，如输入M-x q r r相当于M-x query-replace-regexp
;(partial-completion-mode 1)
;;在minibuffer里启用自动补全函数和变量
(icomplete-mode 1)
;;所有的问题用y/n方式，不用yes/no方式。有点懒，只想输入一个字母
(fset 'yes-or-no-p 'y-or-n-p)
;;允许minibuffer自由变化其大小（指宽度）
(setq resize-mini-windows t)
;;当寻找一个同名的文件，改变两个buffer的名字,前面加上目录名
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
;;允许自动打开图片，如wiki里面
(auto-image-file-mode t)
;;可以操作压缩文档
(auto-compression-mode 1)
;;在minibuffer上面可以显示列号,列号
(column-number-mode t)
(line-number-mode t)
;;显示默认的文档的宽度，看起来比较舒服？
;;latex90分钟介绍里说66是最大限度,看来不错.
(setq fill-column 60)
;不用 TAB 字符来indent, 这会引起很多奇怪的错误。编辑 Makefile 的时候也
;不用担心，因为 makefile-mode 会把 TAB 键设置成真正的 TAB 字符，并且加亮显示的。
(setq tab-width 8)
;; (setq tab-stop-list ())
;; (loop for x downfrom 40 to 1 do
;; (setq tab-stop-list (cons (* x 4) tab-stop-list)))
;;指针不要闪，我得眼睛花了
(blink-cursor-mode -1)
(transient-mark-mode 1)
;;当指针到一个括号时，自动显示所匹配的另一个括号
(show-paren-mode 1)
;;去掉烦人的警告铃声
(setq visible-bell -1)
;;滚动页面时比较舒服，不要整页的滚动
(setq scroll-step 1
  scroll-margin 3
  scroll-conservatively 10000)
;;设定句子结尾，主要是针对中文设置
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space -1)
;;当指针移到另一行，不要新增这一行？
(setq next-line-add-newlines -1)
;;在文档最后自动插入空白一行，好像某些系统配置文件是需要这样的
(setq require-final-newline t)
(setq track-eol t)
;;使用C-k删掉指针到改行末的所有东西
(setq-default kill-whole-line t)
;;设定删除保存记录为200，可以方便以后无限恢复
(setq kill-ring-max 200)
;;改变emacs标题栏的标题,显示buffer的名字
(setq frame-title-format "%b")
;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)
;;把这些缺省禁用的功能打开。
(put 'set-goal-column 'disabled -1)
;;使用narrow功能时的一个设置
(put 'narrow-to-region 'disabled -1) ; C-x n n
(put 'narrow-to-page 'disabled -1) ; C-x n p
(put 'narrow-to-defun 'disabled -1) ; C-x n d

(put 'upcase-region 'disabled -1)
(put 'downcase-region 'disabled -1)

(put 'LaTeX-hide-environment 'disabled -1)
;;向左右滚动的命令激活：C-x < 和 C-x >
(put 'scroll-left 'disabled -1)
;;可以递归的使用 minibuffer。
(setq enable-recursive-minibuffers t)
;;自动重载更改的文件
(global-auto-revert-mode 1)
;;当鼠标移动的时候自动转换frame，window或者minibuffer
(setq mouse-autoselect-window t)

;; 设置时间显示为24小时制，否则为12小时制 
(setq display-time-24hr-format 't) 
;; 显示时间 
(display-time) 

;; 设置文件管理器Dired
(setq dired-recursive-deletes t) ; 可以递归的删除目录
(setq dired-recursive-copies t) ; 可以递归的进行拷贝
(require 'dired-x) ; 有些特殊的功能
(global-set-key "\C-x\C-j" 'dired-jump) ; 通过 C-x C-j 跳转到当前目录的 Dired
(setq dired-guess-shell-alist-user
'(("\\.chm$" "xchm")
  ("\\.jpg$" "gimp")
  ("\\.png$" "gimp")
  ("\\.bmp$" "gimp")
  ("\\.asf$" "mplayer")
  ("\\.wmv$" "mplayer")
  ("\\.htm$" "chromium-browser")
  ("\\.html$" "chromium-browser")
  ("\\.mpg$" "mplayer")
  ("\\.pdf" "evince"))) ; 设置一些文件的默认打开方式，此功能必须在(require 'dired-x)之后 









