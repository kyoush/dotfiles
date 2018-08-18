(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

(setq inhibit-startup-screen t)

;;フォントをRictyにする
(add-to-list 'default-frame-alist '(font . "Ricty-11"))
;;Takaoゴシックにする
;;(add-to-list 'default-frame-alist '(font . "TakaoGothic"))
;;Takao明朝にする
;;(add-to-list 'default-frame-alist '(font . "TakaoMincho"))
;;IPAゴシックにする
;;(add-to-list 'default-frame-alist '(font . "IPAゴシック"))
;;IPA明朝にする
;;(add-to-list 'default-frame-alist '(font . "IPA明朝"))
;;ヒラギノにする
;;(set-face-attribute 'default nil :family "NoteSansCJK-Thin")

;;環境を日本語, UTF-8にする
(require 'mozc)
(set-locale-environment nil)
(set-language-environment"Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq default-input-method "japanese-mozc");

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
(global-linum-mode t)

;;カーソルの点滅をやめる
(blink-cursor-mode 0)

;;カーソル行をハイライトする
;;(global-hl-line-mode t)

;;対応するカッコを光らせる
(show-paren-mode 1)

;;ウィンドウ内に収まらないときだけ、カッコ内も光らせる
(setq show-paren-style 'mixed)
(set-face-background 'show-paren-match-face "grey")
(set-face-foreground 'show-paren-match-face "black")

;;スペース、タブなどを可視化する
;;(global-whitespace-mode 1)

;;半角/全角キーで入力切り替えできるようにする
(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)

;; shut up, emacs!
(setq display-warning-minimum-level :error)

;;(setq inhibit-startup-echo-area-message "USERNAME")
;;(setq inhibit-startup-message t)

;;C-c C-dで行の複製
;;(global-set-key "\C-h\C-s" "\C-a\C- \C-n\M-w\C-y")
(global-set-key "\C-h\C-s" "\C-a\C-k\C-k\C-y\C-y")
(put 'upcase-region 'disabled nil)

;;pythonインデントのエラーがでないようにするための設定
;;(setq tab-width 4)
;;(set-variable 'python-indent-offset 4)
;;(set-variable 'python-indent-guess-indent-offset nil)

;;mozcをmini bufferで表示
(setq mozc-candidate-style 'echo-area)

;;警告音の代わりに画面フラッシュ
(setq visible-bell t)
;;警告音もフラッシュも全て無効
;;(setq ring-bell-function 'ignore)
