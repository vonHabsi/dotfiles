;; =========================
;; package management setup
;; =========================

;; acquire el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))
(el-get 'sync)

;; add elpa to el-get
(require 'el-get-elpa)
(unless (file-directory-p el-get-recipe-path-elpa)
  (el-get-elpa-build-local-recipes))

;; el-get packages
(setq my:el-get-packages
      '(
        ace-jump-mode
        aggressive-indent-mode
        anaconda-mode
        auctex
        company
        company-anaconda
        company-auctex
        ;;company-ghc
        company-math
        company-mode
        escreen
        evil
        evil-leader
        evil-org-mode
        ;;ghc-mod
        golden-ratio
        ;;haskell-mode
        helm
        ;;hi2
        magit
        mu4e
        multiple-cursors
        neotree
        offlineimap
        powerline
        projectile
        rainbow-mode
        reftex
        tomorrow-theme
        undo-tree
        yasnippet
        ))

(el-get 'sync my:el-get-packages)
