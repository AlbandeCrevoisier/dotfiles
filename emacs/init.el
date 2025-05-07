;; Straight — emacs package manager
(defvar bootstrap-version)
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



;; Tools
(straight-use-package 'magit)
(straight-use-package '(forge :after magit))
(setq auth-sources '("~/.authinfo.gpg"))
(straight-use-package 'treemacs)
(straight-use-package 'typit)



;; Completion

;; Bash completion
(straight-use-package 'bash-completion)
(require 'bash-completion)
(bash-completion-setup)

;; Ivy + Counsel + Swiper
(straight-use-package 'ivy)
(straight-use-package 'counsel)
(straight-use-package 'swiper)

;; lsp-mode
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'lsp-ivy)
(straight-use-package 'lsp-treemacs)
(lsp-treemacs-sync-mode 1)
;; lsp-booster
(defun lsp-booster--advice-json-parse (old-fn &rest args)
  "Try to parse bytecode instead of json."
  (or
   (when (equal (following-char) ?#)
     (let ((bytecode (read (current-buffer))))
       (when (byte-code-function-p bytecode)
         (funcall bytecode))))
   (apply old-fn args)))
(advice-add (if (progn (require 'json)
                       (fboundp 'json-parse-buffer))
                'json-parse-buffer
              'json-read)
            :around
            #'lsp-booster--advice-json-parse)
(defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
  "Prepend emacs-lsp-booster command to lsp CMD."
  (let ((orig-result (funcall old-fn cmd test?)))
    (if (and (not test?)                             ;; for check lsp-server-present?
             (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
             lsp-use-plists
             (not (functionp 'json-rpc-connection))  ;; native json-rpc
             (executable-find "emacs-lsp-booster"))
        (progn
          (when-let ((command-from-exec-path (executable-find (car orig-result))))  ;; resolve command from exec-path (in case not found in $PATH)
            (setcar orig-result command-from-exec-path))
          (message "Using emacs-lsp-booster for %s!" orig-result)
          (cons "emacs-lsp-booster" orig-result))
      orig-result)))
(advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)

;; Flycheck
(straight-use-package '(flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)))

;; Company
(straight-use-package '(company-mode
  :config (add-hook 'after-init-hook #'global-company-mode)))                        



;; Appearance

;; N Λ N O
(straight-use-package
  '(nano :type git :host github :repo "rougier/nano-emacs"))
(setq nano-font-family-proportional "Andika")
(setq nano-font-size 16)
;; Replace "#" by "" in nano-modeline
;; require nano-counsel
(require 'nano)

;; Misc
(menu-bar-mode 0)
(blink-cursor-mode 0)



;; Languages

;; Tree-sitter grammars
(setq treesit-language-source-alist
      '((agda "https://github.com/tree-sitter/tree-sitter-agda")
        (bash "https://github.com/tree-sitter/tree-sitter-bash")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; Agda
(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))
