;;;; cl-locatives.asd
;;;;
;;;; Copyright (c) 2013-2014 Robert Smith

(asdf:defsystem #:cl-locatives
  :description "Implementation of locatives, pointer-like objects in Lisp."
  :author "Robert Smith <quad@symbo1ics.com>"
  :license "BSD 3-clause (See LICENSE)"
  :serial t
  :components ((:file "package")
               (:file "cl-locatives")))
