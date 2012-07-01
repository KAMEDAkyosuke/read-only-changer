;; -*- coding:utf-8; mode:emacs-lisp; lexical-binding: t -*-
(defvar read-only-changer-ignore-patterns '())

(defun read-only-changer-ignore-p (pattern-list)
  (letrec ((check-iter (lambda (pattern-list)
                         (cond ((null pattern-list)
                                nil)
                               ((numberp (string-match (car pattern-list)
                                                       buffer-file-name))
                                t)
                               (t
                                (funcall check-iter (cdr pattern-list)))))))
    (funcall check-iter pattern-list)))

(defun read-only-changer ()
  (if (null (read-only-changer-ignore-p read-only-changer-ignore-patterns))
      (setq buffer-read-only t)))

(provide 'read-only-changer
