;;; smartparens-cfg.el --- paren management config

;;; Commentary:
;;; Code:

(require 'smartparens-config)

(smartparens-global-strict-mode t)
(show-paren-mode t)

(setq-default
 sp-autodelete-pair         t
 sp-autodelete-wrap         t
 sp-autodelete-closing-pair t
 sp-autodelete-opening-pair t
 sp-autoinsert-pair         t
 sp-autowrap-region         t
 sp-show-pair-from-inside   t
 sp-show-pair-delay         0.2
 sp-use-subword             t)

(defconst show-sp-hooks '(nxml-mode-hook html-mode-hook ruby-mode-hook fish-mode-hook))
(defun show-sp-activate ()
  (setq-local show-paren-mode nil)
  (show-smartparens-mode t))
(dolist (mode-hook show-sp-hooks) (add-hook mode-hook #'show-sp-activate))

(define-key smartparens-strict-mode-map [remap sp-delete-char] 'delete-char)

(sp-pair "<" ">")
(define-key evil-visual-state-map (kbd "(")  (lambda (&optional arg) (interactive "P") (sp-wrap-with-pair "(")))
(define-key evil-visual-state-map (kbd "[")  (lambda (&optional arg) (interactive "P") (sp-wrap-with-pair "[")))
(define-key evil-visual-state-map (kbd "{")  (lambda (&optional arg) (interactive "P") (sp-wrap-with-pair "{")))
(define-key evil-visual-state-map (kbd "<")  (lambda (&optional arg) (interactive "P") (sp-wrap-with-pair "<")))
(define-key evil-visual-state-map (kbd "\"") (lambda (&optional arg) (interactive "P") (sp-wrap-with-pair "\"")))

(evil-leader/set-key
  "s f" 'sp-forward-slurp-sexp
  "s F" 'sp-forward-barf-sexp
  "s b" 'sp-backward-slurp-sexp
  "s B" 'sp-backward-barf-sexp
  "s u" 'sp-unwrap-sexp
  "s r" 'sp-rewrap-sexp)

(provide 'smartparens-cfg)
;;; smartparens-cfg.el ends here
