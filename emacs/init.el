(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(nord))
 '(custom-safe-themes
   '("37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "80a23d559a5c5343a0882664733fd2c9e039b4dbf398c70c424c8d6858b39fc5" "7f6d4aebcc44c264a64e714c3d9d1e903284305fd7e319e7cb73345a9994f5ef" "d54834a3ec381644880b49fb82ce9d6ccc11997510c7071cfbf3558c8f4b68f6" default))
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(flycheck-yamllint yaml-mode counsel volatile-highlights visual-regexp org-dashboard org org-d20 magit flycheck-cython cython-mode julia-shell julia-mode nord-theme 0blayout flycheck-pycheckers flycheck darkroom sorcery-theme elpy))
 '(pdf-view-midnight-colors '("#dddddd" . "#000000"))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 100 :width normal)))))

;; Python elpy
 '(elpy-folding-fringe-indicators nil)
 '(elpy-modules
   '(elpy-module-company elpy-module-eldoc elpy-module-folding elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-autodoc elpy-module-sane-defaults))
 '(elpy-test-runner 'elpy-test-django-runner)
(elpy-enable)
;; Use flycheck instead of flymake
(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
;; Enable emacs 26 flymake indicators in an otherwise light modeline
(setq elpy-remove-modeline-lighter t)
(advice-add 'elpy-modules-remove-modeline-lighter
            :around (lambda (fun &rest args)
                      (unless (eq (car args) 'flymake-mode)
                        (apply fun args))))
;; Agda
;;(load-file (let ((coding-system-for-read 'utf-8))
;;                (shell-command-to-string "agda-mode locate")))


;; Switch layouts
(0blayout-mode)

;; Visualy highlight operations
(require 'volatile-highlights)
(volatile-highlights-mode t)
