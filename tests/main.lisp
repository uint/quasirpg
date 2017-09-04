;;;; tests/main.lisp

(in-package #:quasirpg-tests)

(def-suite all-tests
    :description "The master suite of all quasiRPG tests.")

(in-suite all-tests)

(defun test-quasi ()
  (run! 'all-tests))

(defun gen-long-float (&key (max (1+ most-positive-long-float))
			 (min (1- most-negative-long-float)))
  (lambda () (+ min (random (1+ (- max min))))))

