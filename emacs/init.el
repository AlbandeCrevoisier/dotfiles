(defvar bootstrap-version) ;; Straight
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'ligature) ;; Fira Code ligatures
(ligature-set-ligatures 't '("www"))
(ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\"
                                     "\\\\\\" "{-" "::" ":::" ":=" "!!" "!="
                                     "!==" "-}" "----" "-->" "->" "->>" "-<"
                                     "-<<" "-~" "#{" "#[" "##" "###" "####" "#("
                                     "#?" "#_" "#_(" ".-" ".=" ".." "..<" "..."
                                     "?=" "??" ";;" "/*" "/**" "/=" "/==" "/>"
                                     "//" "///" "&&" "||" "||=" "|=" "|>" "^="
                                     "$>" "++" "+++" "+>" "=:=" "==" "===" "==>"
                                     "=>" "=>>" "<=" "=<<" "=/=" ">-" ">=" ">=>"
                                     ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|"
                                     "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->"
                                     "<+" "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<"
                                     "<<-" "<<=" "<<<" "<~" "<~~" "</" "</>"
                                     "~@" "~-" "~>" "~~" "~~>" "%%"))
(global-ligature-mode 't)

(straight-use-package
 '(nano-emacs :type git :host github :repo "rougier/nano-emacs"))
(setq nano-font-family-monospaced "Fira Code")
(setq nano-font-family-proportional "Andika")
(setq nano-font-size 18)
(require 'nano)

(pixel-scroll-precision-mode 't)

(straight-use-package 'markdown-mode)

(straight-use-package 'bash-completion)
(require 'bash-completion)
(bash-completion-setup)

(straight-use-package 'scheme-complete)
(autoload 'scheme-smart-complete "scheme-complete" nil t)
(eval-after-load 'scheme
  '(define-key scheme-mode-map "\t" 'scheme-complete-or-indent))
(autoload 'scheme-get-current-symbol-info "scheme-complete" nil t)
(add-hook 'scheme-mode-hook
  (lambda ()
    (make-local-variable 'eldoc-documentation-function)
    (setq eldoc-documentation-function 'scheme-get-current-symbol-info)
    (eldoc-mode)))
(setq lisp-indent-function 'scheme-smart-indent-function)



(straight-use-package 'company) ;; Generic front-end for completion engines
;; TODO use properly?
;;(global-company-mode 't)

(straight-use-package 'magit)
(straight-use-package 'forge) ;; TODO make work
;(with-eval-after-load 'magit
;  (require 'forge))
(setq auth-sources '("~/.authinfo"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
