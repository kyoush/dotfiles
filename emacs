
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (mozc-temp mozc-popup mozc-im mozc))))
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(show-paren-mode t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

(setq inhibit-startup-screen t)

;;日本語設定
(set-locale-environment nil)
(set-language-environment"Japanese")
(set-language-environment"Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;;(set-default-coding-systems 'utf-8-dos)
;;(setq default-file-name-coding-system 'shift_jis);dired
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
;;(require 'mozc-im)
;;(require 'mozc-popup)
;;(require 'mozc-cursor-color)
;;(require 'mozc)
;;(setq default-input-method "japanese-mozc");
;;(setq default-input-method "japanese-mozc-im")

;;popupスタイルを使用する
(setq mozc-condidate-style 'popup)

;;カーソルカラーを設定する
(setq mozc-cursor-color-alist'((direct   ."red")
                               (read-only ."yellow")
                               (hiragana  ."green")
                               (full-katakana ."goldenrod")
                               (half-ascii ."dark orchid")
                               (full-ascii ."orchid")
                               (half-katakana ."dark goldenrod")))

;;カーソルの点滅をオフ
(blink-cursor-mode 0)


      
;;バックアップファイルを作成させない
(setq make-backup-files nil)
(setq auto-save-list-file-prefix nil)

;;終了時にオートセーブファイルを削除する
(setq delete-auto-save-files t)

;;タブにスペースを使用する
(setq-default tab-width 4 indent-tabs-mode t)

;;列数を表示する
(column-number-mode t)

;;行数を表示する
;;(global-linum-mode t)
(global-display-line-numbers-mode)

;;shut up, emacs!
(setq display-warning-minumum-level :error)

;;pythonでインデントのエラーが出ないようにするための設定
(setq tab-width 4)
(set-variable 'python-indent-offset 4)
(set-variable 'python-indent-guess-indent-offset nil)

;;警告音の代わりに画面フラッシュ
(setq visible-bell t)
;;警告音もフラッシュも全て無効
;;(setq ring-bell-function 'ignore)

;;対応するカッコを光らせる
(show-paren-mode 1)

;;ウィンドウ内に収まらないときだけカッコ内も光らせる
(setq show-paren-style 'mixed)
;;(set-face-background 'show-paren-match-face "gray")
;;(set-face-foreground 'show-paren-match-face "black")

;;フォント
(set-frame-font "Moralerspace Argon 10" nil t) ;; Emacs 23.1 or later
;;(set-default-font "Ricty Diminished") ;; Older version of emacs
;;(set-default-font "Nasu Regular")
;;(set-default-font "Yu Gothic UI Regular")
;;(set-default-font "BugMaruPGothic")
;;(set-default-font "PixelMplus12-Regular")
;;(set-default-font "mplus-1mn-regular")

;;(global-whitespace-mode 1)

(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)

;; shut up, emacs!
(setq display-warning-minimum-level :error)

;;(setq inhibit-startup-echo-area-message "USERNAME")
;;(setq inhibit-startup-message t)

;;(global-set-key "\C-h\C-s" "\C-a\C- \C-n\M-w\C-y")
(global-set-key "\C-h\C-s" "\C-a\C-k\C-k\C-y\C-y")
(put 'upcase-region 'disabled nil)

;; インデント
(setq-default c-basic-offset 4 ;;基本インデント量 4
			  tab-width 4
			  indent-tabs-mode nil)

;; C++ Style
(defun add-c++mode-conf ()
  (c-set-style "stroustrup")
  (show-paren-mode t))
(add-hook 'c++-mode-hook 'add-c++-mode-conf)

;; C Style
(defun add-c-mode-common-conf ()
  (c-set-style "stroustrup")
  (show-paren-mode t)
  )
(add-hook 'c-mode-common-hook 'add-c-mode-common-conf)

(require 'package)
;;MELPAを追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("malpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;;初期化
(package-initialize)

;;js2-mode
;;(require 'js2-mode)
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;(add-hook 'js-mode-hook
;;          (lambda ()
;;            (make-local-variable 'js-indent-level)
;;            (setq js-indent-level 2)))
