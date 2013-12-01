(setq ns-pop-up-frames 'nil)


; Python environment
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

;; M-x package-list-packages
;; M-x package-install zenburn-theme
(load-theme 'zenburn t)


;; Fullscrenn
;; (defun toggle-fullscreen ()
;;   (interactive)
;;   (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;; 	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
;;   (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;; 	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
;; )
;; (toggle-fullscreen)


;; Emacs starts a new session every time you open it. To remember your buffers(files) after restart add the following to your .emacs file:

;; (require 'desktop)
;;   (desktop-save-mode 1)
;;   (defun my-desktop-save ()
;;     (interactive)
;;     ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
;;     (if (eq (desktop-owner) (emacs-pid))
;;         (desktop-save desktop-dirname)))
;;   (add-hook 'auto-save-hook 'my-desktop-save)


;; Ido-mode(InteractivelyDoThings) is installed by default. It helps you with auto-completion when you want to change between buffers and other things. If you want to find out more read the docs.
(require 'ido)
(ido-mode t)


;; Color your shell text

;; If you use Emacs there is a very high probability you use your terminal often(or you intend to do). If you want your Emacs terminal emulator to have some colors add to your .emacs file the line:

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;; El-get is similar to package.el(package) except for the fact that it automatically installs all the dependencies. So you don’t have to care about anything else when you install a package.
;; To install it, change to your scratch buffer by typing C-x b scratch RET. Paste this code in by yanking (type C-y):

;; So the idea is that you copy/paste this code into your *scratch* buffer,
;; hit C-j, and you have a working developper edition of el-get.
;; (url-retrieve
;;  "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
;;  (lambda (s)
;;    (let (el-get-master-branch)
;;      (goto-char (point-max))
;;      (eval-print-last-sexp))))

;Hit C-j to execute.
;Add these lines to your .emacs file:

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)


;;Jedi.el is a Python auto-completion package for Emacs.
;;Now you can install Jedi using el-get: M-x el-get-install jedi
;;To enable Jedi add to your .emacs file:

(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)


;;(defun insert-date ()
;;(interactive)
;;(insert (format-time-string "%m/%d/%Y")))
;;(global-set-key (kbd "C-c d") 'insert-date)
