;;;; tests/package.lisp

(defpackage #:quasirpg-tests
  (:use #:cl #:fiveam)
  (:export #:run!
	   #:all-tests
	   #:test-quasi))
