(defvar bootstrap-version) ;; Straight
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
                         user-emacs-directory))
      (bootstrap-version 6))
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
(straight-use-package 'darkroom)
(straight-use-package 'markdown-mode)

(straight-use-package 'bash-completion)
(require 'bash-completion)
(bash-completion-setup)

(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))
(add-hook 'agda2-mode-hook '(lambda () (variable-pitch-mode t)))

(straight-use-package 'speed-type)

;; Alex Shinn Scheme autocomplete & indent
(add-to-list 'load-path "~/.emacs.d/local")
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
;;(global-company-mode 't)

(straight-use-package 'gptel) ;; LLM client

(straight-use-package 'magit)
(straight-use-package 'forge)
;(with-eval-after-load 'magit
;  (require 'forge))
(setq auth-sources '("~/.authinfo"))

(setq treesit-language-source-alist
   '((tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (agda "https://github.com/tree-sitter/tree-sitter-agda" "master" "agda/src")
     ))

;; TypeScript (using Tide)
;; Tide dependencies
(straight-use-package 'typescript-mode)
;; Hacky, worky
(setq major-mode-remap-alist '((typescript-mode . typescript-ts-mode)))
(straight-use-package 'flycheck)
;; Tide
;; Install via use-package
(straight-use-package 'use-package)
(use-package tide
  :straight t
  :ensure t
  :after (company flycheck)
  :hook ((typescript-ts-mode . tide-setup)
         (tsx-ts-mode . tide-setup)
         (typescript-ts-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))
;; aligns annotation to the right hand side
;;(setq company-tooltip-align-annotations t)
;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
;; if you use typescript-mode
(add-hook 'typescript-mode-hook #'setup-tide-mode)
;; if you use treesitter based typescript-ts-mode (emacs 29+)
(add-hook 'typescript-ts-mode-hook #'setup-tide-mode)


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
