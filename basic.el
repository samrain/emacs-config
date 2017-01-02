;;设置 默认目录
(setq default-directory "~/下载/")  
  
(setq default-buffer-file-coding-system 'utf-8)  
(prefer-coding-system 'utf-8)  

;;==========================================================  
;; 高亮当前行：hi-line.el,emacs自己带的
;; (require 'hl-line)  
;; (global-hl-line-mode t)  
;;==========================================================  

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
 (set-frame-font "Noto Sans CJK SC:pixelsize=20")
  ;; 中文字体的设定，网上很多资料都是gb18030，但我的locale是UTF-8
;(set-fontset-font "Noto Sans CJK SC:pixelsize=20")
; (set-fontset-font (frame-parameter nil 'font)
;  'unicode '("WenQuanYi Bitmap Song" . "unicode-bmp"))

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
;(setq make-backup-file-name-function t)

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
(require 'dired+)
;;;;设置dired-subtree
(require 'use-package)
(use-package dired-subtree :ensure t
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))

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
  ("\\.xls$" "et")
  ("\\.pdf$" "evince"))) ; 设置一些文件的默认打开方式，此功能必须在(require 'dired-x)之后 


;; Use 7z and tar to compress/decompress file if possible.
(defvar yc/dired-compress-file-suffixes
  (list
   ;; Regexforsuffix-Programm-Args.
   (list (rx "." (or "gz" "Z" "z" "dz" "bz2" "xz" "zip" "rar" "7z")) "7z" "x")
   (list (rx "." (or "tar.gz" "tgz")) "tar" "xzvf")
   (list (rx "." (or "tar.bz2" "tbz")) "tar" "xjvf")
   (list (rx ".tar.xz") "tar" "xJvf"))
  "nil")

(defun yc/dired-check-process (msg program &rest arguments)
  (let (err-buffer err (dir default-directory))
    (message "%s..." msg )
    (save-excursion
      ;; Get a clean buffer for error output:
      (setq err-buffer (get-buffer-create " *dired-check-process output*"))
      (set-buffer err-buffer)
      (erase-buffer)
      (setq default-directory dir   ; caller's default-directory
            err (not (eq 0 (apply 'process-file program nil t nil
                                  (if (string= "7z" program) "-y" " ") arguments))))
      (if err
          (progn
            (if (listp arguments)
                (let ((args "") )
                  (mapc (lambda (X)
                            (setq args (concat args X " ")))
                          arguments)
                  (setq arguments args)))
            (dired-log (concat program " " (prin1-to-string arguments) "\n"))
            (dired-log err-buffer)
            (or arguments program t))
        (kill-buffer err-buffer)
        (message "%s...done" msg)
        nil))))


(defun yc/dired-compress-file (file)
  ;; Compress or uncompress FILE.
  ;; Return the name of the compressed or uncompressed file.
  ;; Return nil if no change in files.
  (let ((handler (find-file-name-handler file 'dired-compress-file))
        suffix newname
        (suffixes yc/dired-compress-file-suffixes))

    ;; See if any suffix rule matches this file name.
    (while suffixes
      (let (case-fold-search)
        (if (string-match (car (car suffixes)) file)
            (setq suffix (car suffixes) suffixes nil))
        (setq suffixes (cdr suffixes))))
    ;; If so, compute desired new name.
    (if suffix
        (setq newname (substring file 0 (match-beginning 0))))
    (cond (handler
           (funcall handler 'dired-compress-file file))
          ((file-symlink-p file)
           nil)
          ((and suffix (nth 1 suffix))
           ;; We found an uncompression rule.
           (if
               (and (or (not (file-exists-p newname))
                        (y-or-n-p
                         (format "File %s already exists.  Replace it? "
                                 newname)))
                    (not (yc/dired-check-process (concat "Uncompressing " file)
                                                 (nth 1 suffix) (nth 2 suffix) file)))
               newname))
          (t
           ;;; We don't recognize the file as compressed, so compress it.
           ;;; Try gzip; if we don't have that, use compress.
           (condition-case nil
               (let ((out-name (concat file ".7z")))
                 (and (or (not (file-exists-p out-name))
                          (y-or-n-p
                           (format "File %s already exists.  Really compress? "
                                   out-name)))
                      (not (yc/dired-check-process (concat "Compressing " file)
                                                   "7z" "a" out-name file))
                      ;; Rename the compressed file to NEWNAME
                      ;; if it hasn't got that name already.
                      (if (and newname (not (equal newname out-name)))
                          (progn
                            (rename-file out-name newname t)
                            newname)
                        out-name))))))))

(defadvice dired-compress (around yc/dired-compress )
  "If last action was not a yank, run `browse-kill-ring' instead."
  (let* (buffer-read-only
         (from-file (dired-get-filename))
         (new-file (yc/dired-compress-file from-file)))
    (if new-file
        (let ((start (point)))
          ;; Remove any preexisting entry for the name NEW-FILE.
          (ignore-errors (dired-remove-entry new-file))
          (goto-char start)
          ;; Now replace the current line with an entry for NEW-FILE.
          (dired-update-file-line new-file) nil)
      (dired-log (concat "Failed to compress" from-file))
      from-file))
  )
(ad-activate 'dired-compress)

(use-package golden-ratio
  :ensure t
  :diminish golden-ratio-mode
  :init
  (golden-ratio-mode 1))
