                             CL-LOCATIVES
                             ============

                           By Robert Smith

Locatives are the Lisp equivalent of pointers, minus the
arithmetic. In Lisp terms, they make the concept of "places"
first-class.

The main API consists of the macro LOCATIVE-FOR, which takes as an
argument a place, as you would give to SETF; and the function
DEREFERENCE, which extracts the value of that place, and (SETF
DEREFERENCE), which sets the value of that place.

The following example pretty much sums up the API:

(let* ((x (make-array 5 :initial-element 0))
       (l (locative-for (aref x 2))))
  (setf (dereference l) 5)
  (list l
        x
        (dereference l)))

gives

(#<LOCATIVE {100612B943}> #(0 0 5 0 0) 5)

as a result. We also have LOCATIVEP, and you can funcall the
LOCATIVE-WRITER of a locative if you need to deal with multiple values
(a rare case).

This code can be very useful for porting over C code which uses
pointers and by-reference values a lot.
