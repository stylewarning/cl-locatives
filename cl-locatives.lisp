;;;; cl-locatives.lisp
;;;
;;;; Copyright (c) 2013-2014 Robert Smith

(in-package #:cl-locatives)

(defstruct (locative (:predicate locativep)
                     (:constructor %make-locative)
                     (:copier nil)
                     (:print-function
                      (lambda (obj stream depth)
                        (declare (ignore depth))
                        (print-unreadable-object (obj stream :type t
                                                             :identity t)))))
  "A pointer-like data structure to allow, among other things, \"reference passing\" programming style."
  (reader (error "Must provide reader function.") :type function
                                                  :read-only t)
  (writer (error "Must provide writer function.") :type function
                                                  :read-only t))

(defmacro locative-for (place &environment env)
  "Return a locative for the place PLACE.

PLACE should be a form that can be passed as the first argument to SETF."
  (multiple-value-bind (vars vals store-vars writer-form reader-form)
     (get-setf-expansion place env)
  `(let* ,(mapcar #'list vars vals)
     (%make-locative :reader (lambda () ,reader-form)
                     :writer (lambda ,store-vars ,writer-form)))))

(defun dereference (locative)
  "Return a value that a locative LOCATIVE \"points\" to."
  (funcall (locative-reader locative)))

;;; This DEFSETF is actually incorrect. It is possible that the writer
;;; function can take multiple values. To use the full functionality,
;;; one must simply use LOCATIVE-WRITER.
;;;
;;; FIXME: Use DEFINE-SETF-EXPANDER instead.
(defsetf dereference (locative) (new-val)
  `(funcall (locative-writer ,locative) ,new-val))
