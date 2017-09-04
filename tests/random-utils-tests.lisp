;;;; tests/random-utils-tests.lisp

(in-package #:quasirpg-tests)

(def-suite random-utils-tests
    :description "Test the random utilities."
    :in all-tests)

(in-suite random-utils-tests)

(test dice-tests
  :description "Test the `roll-dice` function."
  (is (= 1 (quasirpg::roll-dice 1 1)))
  (is (= 3 (quasirpg::roll-dice 3 1)))
  (for-all ((n (gen-integer :min 1 :max 10))
	    (sides (gen-integer :min 1 :max 10)))
    "Test whether calls with random positive integers give results within expected bounds."
    (let ((min n)
	  (max (* n sides))
	  (result (quasirpg::roll-dice n sides)))
      (is (<= min result))
      (is (>= max result))))
  (for-all ((valid-float (gen-long-float :min 1 :max 100)))
    "Test whether floats are rounded down."
    (is (= (floor valid-float) (quasirpg::roll-dice valid-float 1)))
    (is (>= (floor valid-float) (quasirpg::roll-dice 1 valid-float))))
  (for-all ((invalid-int (gen-integer :max 0))
	    (invalid-int2 (gen-integer :max 0))
	    (valid-int (gen-integer :min 1)))
    "Test whether non-positive numbers signal SIMPLE-TYPE-ERROR."
    (signals simple-type-error (quasirpg::roll-dice valid-int invalid-int))
    (signals simple-type-error (quasirpg::roll-dice invalid-int valid-int))
    (signals simple-type-error (quasirpg::roll-dice invalid-int invalid-int2))))
