;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-full-name "Brandon Shega"
      user-mail-address "b.shega@gmail.com"
      epa-file-encrypt-to user-mail-address

      company-idle-delay 0.3
      doom-font (font-spec :family "Monaco" :size 12)
      doom-theme 'doom-dracula
      display-line-numbers-type 'relative
      doom-themes-treemacs-theme "doom-colors"
      org-directory "~/Dropbox/Organization")

(when IS-MAC
  (setq ns-use-thin-smoothing t))

(map! :m "M-j" #'multi-next-line
      :m "M-k" #'multi-previous-line

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

(after! typescript-mode
  (setq typescript-indent-level 2))

(after! emmet-mode
  (map! :map emmet-mode-keymap
        :v [tab] #'emmet-wrap-with-markup
        :i [tab] #'+web/indent-or-yas-or-emmet-expand))

(after! web-mode
  (setq web-mode-markup-indent-offset 2
        web-mode-code-indent-offset 2))
