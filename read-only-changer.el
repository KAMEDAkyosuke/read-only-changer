;; -*- coding:utf-8; mode:emacs-lisp; lexical-binding: t -*-
(defvar read-only-changer-writeable-file-list '())

(defun read-only-changer-writeable-file-p (writeable-file-list)
  (let ((check-iter (lambda (writeable-file-list)
                      (cond ((null writeable-file-list)
                             nil)
                            ((numberp (string-match (car writeable-file-list)
                                                    buffer-file-name))
                             t)
                            (t
                             (funcall check-iter (cdr writeable-file-list)))))))
    (funcall check-iter writeable-file-list)))

(defun read-only-changer ()
  (if (null (read-only-changer-writeable-file-p read-only-changer-writeable-file-list))
      (setq buffer-read-only t)))

(provide 'read-only-changer)
