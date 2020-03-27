(setq user-full-name "Brandon Shega"
      user-mail-address "b.shega@gmail.com"
      epa-file-encrypt-to user-mail-address)

(setq doom-font (font-spec :family "JetBrains Mono" :size 12))

(setq doom-theme 'doom-snazzy
      doom-themes-treemacs-theme "doom-colors")

(map! :leader "`" #'evil-switch-to-windows-last-buffer)

(map! :leader
    (:prefix-map ("c" . "code")
    :desc "LSP perform action" "a" #'lsp-execute-code-action))

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

(map! :map +doom-dashboard-mode-map [remap projectile-find-file] #'counsel-find-file)

(setq epa-file-encrypt-to user-mail-address
      company-idle-delay 0.2
      evil-split-window-below t
      evil-vsplit-window-right t
      display-line-numbers-type 'relative)

(when IS-MAC
  (setq ns-use-thin-smoothing t
        mac-command-modifier 'meta
        mac-option-modifier 'super))

(after! org (set-popup-rule! "^\\*Org.*Export\\*" :side 'right :size 0.5 :modeline t))
(after! org (set-popup-rule! "^Capture.*\\.org$" :side 'right :size .40 :select t :vslot 2 :ttl 3))
(after! org (set-popup-rule! "*org agenda*" :side 'right :size .40 :select t :vslot 2 :ttl 3))

(setq org-agenda-use-time-grid nil
      org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-habit-show-habits t)

(load-library "find-lisp")
(after! org
  (setq org-agenda-files (find-lisp-find-files "~/Dropbox/Organization" "\.org$")))

(after! org
  (setq org-capture-templates
        '(("g" "GTD")
          ("r" "References")
          ("d" "Diary")
          ("n" "Notes")
          ("t" "TODO"))))

(after! org (add-to-list 'org-capture-templates
                         '("gr" "Recurring Task" entry (file "~/Dropbox/Organization/gtd/recurring.org")
"* TODO %^{description}
:PROPERTIES:
:CREATED: %U
:END:
:RESOURCES:
:END:

+ NOTES:
  %?")))

(after! org (add-to-list 'org-capture-templates
                         '("gp" "Project" entry (file+headline "~/Dropbox/Organization/gtd/tasks.org" "Projects")
"* TODO %^{description}
:PROPERTIES:
:SUBJECT: %^{subject}
:GOAL: %^{goal}
:END:
:RESOURCES:
:END:

+ REQUIREMENTS:
  %^{requirements}

+ NOTES:
  %?

\** TODO %^{task1}")))

(after! org (add-to-list 'org-capture-templates
             '("gt" "Capture Task" entry (file "~/Dropbox/Organization/gtd/inbox.org")
"** TODO %?
:PROPERTIES:
:CREATED:    %U
:END:
:RESOURCES:
:END:

+ NEXT STEPS:
  - [ ] %^{next steps}

+ NOTES:")))

(after! org (add-to-list 'org-capture-templates
             '("re" "Yank New Example" entry (file+headline "~/Dropbox/Organization/notes/examples.org" "INBOX")
"* %^{example}
:PROPERTIES:
:SOURCE:  %^{source|Command|Script|Code|Usage}
:SUBJECT: %^{subject}
:END:

\#+BEGIN_SRC
%x
\#+END_SRC
%?")))

(after! org (add-to-list 'org-capture-templates
             '("rn" "Yank new Example" entry (file+headline "~/Dropbox/Organization/notes/references.org" "INBOX")
"* %^{example}
:PROPERTIES:
:CATEGORY: %^{category}
:SUBJECT:  %^{subject}
:END:
:RESOURCES:
:END:

%?")))

(after! org (add-to-list 'org-capture-templates
             '("dn" "New Diary Entry" entry (file+olp+datetree "~/Dropbox/Organization/diary.org" "Daily Logs")
"* %^{thought for the day}
:PROPERTIES:
:CATEGORY: %^{category}
:SUBJECT:  %^{subject}
:MOOD:     %^{mood}
:END:
:RESOURCES:
:END:

\*What was one good thing you learned today?*:
- %^{whatilearnedtoday}

\*List one thing you could have done better*:
- %^{onethingdobetter}

\*Describe in your own words how your day was*:
- %?")))

(setq org-directory "~/Dropbox/Organization"
      org-image-actual-width nil
      +org-export-directory "~/Dropbox/Organization/.export/"
      org-archive-location "~/Dropbox/Organization/gtd/archive.org::datetree/"
      org-default-notes-file "~/Dropbox/Organization/gtd/inbox.org"
      projectile-project-search-path '("~/"))

(setq org-html-head-include-scripts t
      org-export-with-toc t
      org-export-with-author t
      org-export-headline-levels 5
      org-export-with-drawers t
      org-export-with-email t
      org-export-with-footnotes t
      org-export-with-latex t
      org-export-with-section-numbers nil
      org-export-with-properties t
      org-export-with-smart-quotes t)

;(after! org (add-to-list 'org-export-backends 'pandoc))
(after! org (setq org-export-backends '("pdf" "ascii" "html" "latex" "odt")))

(after! org (setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w!)" "STARTED(s!)" "NEXT(n!)" "DELEGATED(e!)" "|" "INVALID(I!)" "DONE(d!)"))))

(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6)))
      org-hide-emphasis-markers nil
      org-outline-path-complete-in-steps nil
      org-refile-allow-creating-parent-nodes 'confirm)

(setq jiralib-url "https://gpgdigital.atlassian.net/")

(after! forge
  (push '("git.moen.com" "git.moen.com/api/v3"
          "git.moen.com" forge-github-repository)
        forge-alist))
(setq ghub-use-workaround-for-emacs-bug 'force)

(require 'auth-source)
(let ((credential (auth-source-user-and-password "api.github.com")))
  (setq grip-github-user (car credential)
        grip-github-password (cadr credential)))

;; (setq lsp-eslint-server-command
  ;;     '("node"
    ;;     "/Users/bshega/.vscode-insiders/extensions/dbaeumer.vscode-eslint-2.1.1/server/out/eslintServer.js"
      ;;   "--stdio"))
(after! flycheck
  (flycheck-add-next-checker 'lsp 'javascript-eslint t))

(setq lsp-clients-angular-language-server-command
      '("node"
        "/usr/lib/node_modules/@angular/language-server"
        "--ngProbeLocations"
        "/usr/lib/node_modules"
        "--tsProbeLocations"
        "/usr/lib/node_modules"
        "--stdio"))

(use-package! ox-gfm
  :after org
  :init
  (require 'ox-gfm nil t))

(use-package! ob-plantuml
  :ensure nil
  :commands
  (org-babel-execute: plantum)
  :config
  (setq org-plantuml-jar-path (expand-file-name "~/Dropbox/opt/plantuml.jar")))

(after! gcmh
  (setq gcmh-high-cons-threshold 8388608))
