;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; For email clients
(setq user-full-name "Sergio Fuentes"
      user-mail-address "fonti880@gmail.com")

;; Font setup
(setq doom-font (font-spec :family "AtkynsonMono Nerd Font"
                           :size 14
                           :weight 'regular)
      doom-big-font (font-spec :family "AtkynsonMono Nerd Font"
                               :size 20)
      doom-variable-pitch-font (font-spec :family "AtkynsonMono Nerd Font Propo"
                                          :size 14)
      doom-unicode-font (font-spec :family "Noto Emoji"))
;; Default theme
(setq doom-theme 'doom-rouge)

;; Maintain terminal transparency in Doom Emacs
(after! doom-themes
  (unless (display-graphic-p)
    (set-face-background 'default "undefined")))
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Blink cursor
(blink-cursor-mode 1)

;; Line wrapping
(global-visual-line-mode t)

;; Performance optimizations
(setq gc-cons-threshold (* 256 1024 1024))
(setq read-process-output-max (* 4 1024 1024))
(setq comp-deferred-compilation t)
(setq comp-async-jobs-number 8)

;; Map undo
(map! "C-z" #'undo)
(after! undo-fu
  (map! "C-z" #'undo))

;; True transparency (Emacs 29+)
;; Only background is transparent, text stays opaque
(add-to-list 'default-frame-alist '(alpha-background . 92))

;; Optional: Reduce blur/shadow artifacts
(setq frame-resize-pixelwise t)

;; Disable internal borders for cleaner look
(setq window-divider-default-bottom-width 1
      window-divider-default-right-width 1)

;; Enable window dividers with subtle style
(window-divider-mode 1)

;; Better colors for transparency
(custom-set-faces!
  '(window-divider :foreground "#3c3836")
  '(window-divider-first-pixel :foreground "#3c3836")
  '(window-divider-last-pixel :foreground "#3c3836"))

;; Smooth scrolling (works well with blur)
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Optional: Undecorated frame (no title bar)
(add-to-list 'default-frame-alist '(undecorated . t))

;; Jinx spell checker configuration
(use-package! jinx
  :hook (emacs-startup . global-jinx-mode)
  :config
  ;; Use both English and Spanish simultaneously
  (setq jinx-languages "en_US es_MX"))

(map! :leader
      :desc "Spell check" "z c" #'jinx-correct
      :desc "Change language" "z l" #'jinx-languages)

;; Journal and orgmode
(setq org-journal-dir "~/org/journal/")
(setq org-journal-file-type 'daily)
(setq org-journal-date-format "%A, %d %B %Y")

(after! org
  ;; Custom timestamp format with dots
  (setq org-time-stamp-custom-formats
        '("<%Y.%m.%d %a>" . "<%Y.%m.%d %a %H:%M>"))

  ;; Enable custom time format display
  (setq org-display-custom-times t))

;; Org-cal sync
(let ((private-config (expand-file-name "private/org-gcal-credentials.el" doom-private-dir)))
  (when (file-exists-p private-config)
    (load private-config)))
