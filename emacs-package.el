
;; my packages
(setq my-packages
      '(
	paredit
	rainbow-delimiters
	evil
	evil-mc
	evil-magit
	ess
	auctex
	helm
	auto-complete
	ac-helm
	evil-leader
	evil-surround
	key-chord
	git-gutter
	
))

;; refresh package list if it is not already available
(when (not package-archive-contents) (package-refresh-contents))

;; install packages from the list that are not yet installed
(dolist (pkg my-packages)
    (when (and (not (package-installed-p pkg)) (assoc pkg package-archive-contents))
        (package-install pkg)))
