;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     html
     sql
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     git
     github
     version-control
     markdown
     ;; org
     ;; shell
     ;; syntax-checking
     clojure
     erlang
     )
   ;; List of additional packages that will be installed wihout being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(wombat
                         monokai)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Droid Sans Mono Dotted"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  ;; do not highlight the current line. I don't want underlining, EVER.
  (global-hl-line-mode -1)

  ;; arrows are consistent with my vim airline
  (setq powerline-default-separator 'arrow)

  (defun silence ()
    (interactive))

  ;; I hate when the cursor jumps when I click on the window, plz stahp
  (define-key evil-motion-state-map [down-mouse-1] 'silence)
  ;; also avoid any '<mouse-1> is undefined' when setting to 'undefined
  ;; I know, it is deliberate
  (define-key evil-motion-state-map [mouse-1] 'silence)

  (evil-leader/set-key "o+" 'evil-numbers/inc-at-pt)
  (evil-leader/set-key "o-" 'evil-numbers/dec-at-pt)

  ;; exclude some useless files in helm
  (setq helm-ff-skip-boring-files t)
  ;; helm does not let you exclude . and .. so just exclude stuff that begins
  ;; with a dot and continues with at least one non-dot
  ;; first matches .*/ - there might be some path in front
  ;; then \\. - the initial dot
  ;; then [^\\.]+ - something that is not a dot, at least one time
  (setq helm-boring-file-regexp-list '(".*/\\.[^\\.]+"))

  ;; beloved window navigation shortcuts (they seem quite emacs-like)
  (define-key evil-normal-state-map (kbd "C-w <left>") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-w <down>") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-w <up>") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-w <right>") 'evil-window-right)

  ;; default filters for CIDER stacktraces
  (setq cider-stacktrace-default-filters '(java tooling dup))
  (add-hook 'clojure-mode-hook #'spacemacs/toggle-aggressive-indent-on)
  ;; indentation adjustments
  (add-hook 'clojure-mode-hook (lambda ()
                                 (define-clojure-indent
                                            (import-loaders 0)
                                            (import-sources 0)
                                            (try+ 0)
                                            (catching-404 0)
                                            (unique-for 0))))
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode sql-indent uuidgen toc-org org-plus-contrib org-bullets link-hint hide-comnt github-search evil-visual-mark-mode evil-unimpaired evil-ediff dumb-jump f column-enforce-mode marshal ht request gitignore-mode fringe-helper git-gutter+ flx git-commit with-editor peg eval-sexp-fu spinner epl packed bind-map spacemacs-theme spaceline powerline persp-mode page-break-lines neotree magit-gitflow leuven-theme info+ highlight-numbers helm-swoop helm-projectile helm-ag github-clone gitconfig-mode eyebrowse evil-mc evil-matchit evil-magit erlang diff-hl clj-refactor multiple-cursors paredit yasnippet cider clojure-mode buffer-move avy anzu iedit smartparens highlight git-gutter projectile helm popup helm-core gh pcache markdown-mode s magit magit-popup async dash hydra package-build use-package which-key evil ws-butler window-numbering volatile-highlights vi-tilde-fringe undo-tree smooth-scrolling smeargle restart-emacs rainbow-delimiters queue quelpa popwin pkg-info pcre2el parent-mode paradox orgit open-junk-file move-text mmm-mode markdown-toc magit-gh-pulls macrostep lorem-ipsum logito linum-relative inflections indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-indentation help-fns+ helm-themes helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds goto-chg google-translate golden-ratio github-browse-file gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu elisp-slime-nav edn diminish define-word clean-aindent-mode cider-eval-sexp-fu bracketed-paste bind-key auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
