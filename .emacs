;; Michael Galanakis
;; 2016-03-30

;; repositories ----

(require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
(package-initialize)
(load "~/emacs-package.el")

;; os crap ----

(when (string-equal system-type "windows-nt")
    (setq shell-file-name "C:/cygwin/bin/bash.exe") 
    (setq exec-path (cons "C:/cygwin/bin" exec-path)))

(when (string-equal system-type "darwin")
    (setq mac-option-modifier mac
	nil-command-modifier 'meta
	x-select-enable-clipboard t)
    (tool-bar-mode 0)
    (setq default-input-method "MacOSX"))


;; packages ----

(require 'evil-magit)

(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x f") 'helm-find-files)
(helm-mode 1)

(require 'auto-complete)
(ac-config-default)

(require 'ac-helm)
(global-set-key (kbd "M-d") 'ac-complete-with-helm)

(require 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader "SPC")
(evil-leader/set-key
 "o" 'other-window
 "b" 'switch-to-buffer
 "w" 'save-buffer)

(require 'evil)
(evil-mode 1)

;; evil mode ----

;; evil extra

(require 'evil-surround)
(global-evil-surround-mode 1)

;; keybindings

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-k") 'kill-line)
(define-key evil-insert-state-map (kbd "C-n") 'next-line)
(define-key evil-insert-state-map (kbd "C-p") 'previous-line)

(define-key evil-ex-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-ex-map (kbd "C-e") 'move-end-of-line)

(require 'ess)
;(setq ess-eval-visibly-p nil)
(setq ess-ask-for-ess-directory nil)
(setq ess-fancy-comments nil) ; important!
