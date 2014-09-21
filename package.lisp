;;;; package.lisp
;;;;
;;;; Copyright (c) 2013-2014 Robert Smith

(defpackage #:cl-locatives
  (:documentation "A package for creating and manipulating locatives.")
  (:use #:cl)
  (:nicknames #:loc)
  (:export #:locative                   ; TYPE
           #:locativep                  ; FUNCTION (PREDICATE)
           #:locative-for               ; MACRO
           #:dereference                ; ACCESSOR
           
           #:locative-writer            ; XXX: To be deprecated.
           ))

