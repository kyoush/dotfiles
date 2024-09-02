;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (rainbow-mode js2-mode mozc-temp mozc-popup mozc-im mozc))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;

;; フレーム関連

;;;;;;;;;;;;;;;;;;;;;;
;; 起動時のフレーム設定
(setq initial-frame-alist
      (append (list
               ;; 表示位置
               '(top . 10)
               '(left . 10)
               ;; サイズ
               '(width . 85) ;横
               '(height . 40)) ;縦
              initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

;;日本語設定
(set-language-environment"Japanese")
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; 2020/1/14 Windows IME
(setq default-input-method "W32-IME")
(setq-default w32-ime-mode-line-state-indicator "[--]")
(setq w32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
(w32-ime-initialize)
;; 日本語入力時にカーソルの色を変える設定
(add-hook 'w32-ime-on-hook '(lambda () (set-cursor-color "black")))
(add-hook 'w32-ime-off-hook '(lambda () (set-cursor-color "white")))

;; ミニバッファに移動した際は最初に日本語入力が無効な状態にする
(add-hook 'minibuffer-setup-hook 'deactivate-input-method)

;; iserchに移行した際に日本語入力を無効にする
(add-hook 'iserch-mode-hook '(lambda ()
                               (deactivate-input-method)
                               (setq w32-ime-composition-window (minibuffer-window))))
(add-hook 'iserch-mode-end-hook '(lambda () (setq w32-ime-composition-window nil)))

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
(setq auto-save-default nil) ;; .#*とかのファイルを作らない
(setq make-backup-files nil) ;; *.~とかのファイルを作らない
;; (setq auto-save-list-file-prefix nil)

;;終了時にオートセーブファイルを削除する
(setq delete-auto-save-files t)

;;タブにスペースを使用する
(setq-default tab-width 4 indent-tabs-mode t)

;;列数を表示する
(column-number-mode t)

;;行数を表示する
(global-linum-mode t)

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
;;(setq show-paren-style 'mixed)
;;(set-face-background 'show-paren-match-face "gray")
;;(set-face-foreground 'show-paren-match-face "black")

;;フォント
(set-default-font "Ricty Diminished-16")
;;(set-default-font "Nasu Regular")
;;(set-default-font "Yu Gothic UI Regular")
;;(set-default-font "BugMaruPGothic")
;;(set-default-font "PixelMplus12-Regular")
;;(set-default-font "mplus-1mn-regular")

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
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js-mode-hook
          (lambda ()
(make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

;; reinbow-modeの設定(カラーコードに色をつける)
(require 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'less-mode-hook 'rainbow-mode)
(add-hook 'web-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)
(add-hook 'js2-mode-hook 'rainbow-mode)
