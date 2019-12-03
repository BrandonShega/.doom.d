;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-full-name "Brandon Shega"
      user-mail-address "b.shega@gmail.com"
      epa-file-encrypt-to user-mail-address

      company-idle-delay 0.2
      doom-font (font-spec :family "Monaco" :size 12)
      doom-theme 'doom-gruvbox
      display-line-numbers-type 'relative
      doom-themes-treemacs-theme "doom-colors"
      org-directory "~/Dropbox/Organization")

(when IS-MAC
  (setq ns-use-thin-smoothing t
        mac-command-modifier 'meta
        mac-option-modifier 'super))

(map! :leader "`" #'evil-switch-to-windows-last-buffer)

(map!
      ;; Easier window movement
      :n "C-h" #'evil-window-left
      :n "C-j" #'evil-window-down
      :n "C-k" #'evil-window-up
      :n "C-l" #'evil-window-right

      (:map vterm-mode-map
        ;; Easier window movement
        :i "C-h" #'evil-window-left
        :i "C-j" #'evil-window-down
        :i "C-k" #'evil-window-up
        :i "C-l" #'evil-window-right)

      (:map evil-treemacs-state-map
        "C-h" #'evil-window-left
        "C-l" #'evil-window-right))

(setq +workspaces-switch-project-function #'ignore)
(setq evil-split-window-below t
      evil-vsplit-window-right t)

(after! forge
  (push '("git.moen.com" "git.moen.com/api/v3"
          "git.moen.com" forge-github-repository)
        forge-alist))

(fset 'battery-update #'ignore)
