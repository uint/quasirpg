;;;; tests/char-gen-tests.lisp

(in-package #:quasirpg-tests)

(def-suite character-generation-tests
    :description "Test the character generation stuff."
    :in all-tests)

(in-suite character-generation-tests)

(test make-character-tests
  :description "Test the `make-character` function."
  (let ((name (quasirpg::name (quasirpg::make-character "tom" '("str" "dex")))))
    (is (string= "Tom" name)
	"MAKE-CHARACTER should capitalize the name \"tom\", but we got: ~s" name)))
