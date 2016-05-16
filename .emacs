;; MICHAEL Galanakis
;; UPDATED: 2016-05-16

;; repositories ----

(require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
(package-initialize)
(load "~/emacs-package.el")

;; os crap ----

(when (and (>= emacs-major-version 23)
           (equal window-system 'w32))
  (require 'server)
  (defun server-ensure-safe-dir (dir) "Noop" t)
  (server-start))

(when (string-equal system-type "darwin")
    (setq default-input-method "MacOSX"))

;; settings ----

(set-face-attribute 'default nil :height 180)
(tool-bar-mode 0)

;; packages ----

(require 'paredit)
(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(require 'multiple-cursors)

(require 'evil-magit)
(require 'git-gutter)
(global-git-gutter-mode +1)

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
