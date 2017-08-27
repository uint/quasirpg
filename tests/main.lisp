;;;; tests/main.lisp

(in-package #:quasirpg-tests)

(def-suite all-tests
    :description "The master suite of all quasiRPG tests.")

(in-suite all-tests)

(defun test-quasi ()
  (run! 'all-tests))

(defun test-a-lot-of-dice ()
  (every #'identity (loop for i from 1 to 100
		       collecting (let ((result (quasirpg::roll-dice 2 10)))
				    (and (>= result 2)
					 (<= result 20))))))

(test dice-tests
  :description "Test the `roll-dice` function."
  (is (= 1 (quasirpg::roll-dice 1 1)))
  (is (= 3 (quasirpg::roll-dice 3 1)))
  (is-true (test-a-lot-of-dice)))
