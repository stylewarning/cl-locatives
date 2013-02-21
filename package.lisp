;;;; package.lisp
;;;; Copyright (c) 2013 Robert Smith

(defpackage #:cl-locatives
  (:use #:cl)
  (:nicknames #:loc)
  (:export #:locative                   ; type
           #:locativep
           #:locative-writer            ; TO BE DEPRECATED
           #:locative-for
           #:dereference))

