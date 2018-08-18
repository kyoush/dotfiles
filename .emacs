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

;;�ե���Ȥ�Ricty�ˤ���
(add-to-list 'default-frame-alist '(font . "Ricty-11"))
;;Takao�����å��ˤ���
;;(add-to-list 'default-frame-alist '(font . "TakaoGothic"))
;;Takao��ī�ˤ���
;;(add-to-list 'default-frame-alist '(font . "TakaoMincho"))
;;IPA�����å��ˤ���
;;(add-to-list 'default-frame-alist '(font . "IPA�����å�"))
;;IPA��ī�ˤ���
;;(add-to-list 'default-frame-alist '(font . "IPA��ī"))
;;�ҥ饮�Τˤ���
;;(set-face-attribute 'default nil :family "NoteSansCJK-Thin")

;;�Ķ������ܸ�, UTF-8�ˤ���
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

;;�Хå����åץե��������������ʤ�
(setq make-backup-files nil)
(setq auto-save-list-file-prefix nil)

;;��λ���˥����ȥ����֥ե������������
(setq delete-auto-save-files t)

;;���֤˥��ڡ�������Ѥ���
(setq-default tab-width 4 indent-tabs-mode t)

;;�����ɽ������
(column-number-mode t)

;;�Կ���ɽ������
(global-linum-mode t)

;;������������Ǥ����
(blink-cursor-mode 0)

;;��������Ԥ�ϥ��饤�Ȥ���
;;(global-hl-line-mode t)

;;�б����륫�å�����餻��
(show-paren-mode 1)

;;������ɥ���˼��ޤ�ʤ��Ȥ����������å������餻��
(setq show-paren-style 'mixed)
(set-face-background 'show-paren-match-face "grey")
(set-face-foreground 'show-paren-match-face "black")

;;���ڡ��������֤ʤɤ�Ļ벽����
;;(global-whitespace-mode 1)

;;Ⱦ��/���ѥ����������ڤ��ؤ��Ǥ���褦�ˤ���
(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)

;; shut up, emacs!
(setq display-warning-minimum-level :error)

;;(setq inhibit-startup-echo-area-message "USERNAME")
;;(setq inhibit-startup-message t)

;;C-c C-d�ǹԤ�ʣ��
;;(global-set-key "\C-h\C-s" "\C-a\C- \C-n\M-w\C-y")
(global-set-key "\C-h\C-s" "\C-a\C-k\C-k\C-y\C-y")
(put 'upcase-region 'disabled nil)

;;python����ǥ�ȤΥ��顼���Ǥʤ��褦�ˤ��뤿�������
;;(setq tab-width 4)
;;(set-variable 'python-indent-offset 4)
;;(set-variable 'python-indent-guess-indent-offset nil)

;;mozc��mini buffer��ɽ��
(setq mozc-candidate-style 'echo-area)

;;�ٹ𲻤�����˲��̥ե�å���
(setq visible-bell t)
;;�ٹ𲻤�ե�å��������̵��
;;(setq ring-bell-function 'ignore)
