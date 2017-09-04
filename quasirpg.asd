;;;; quasirpg.asd

(asdf:defsystem #:quasirpg
  :description "Part of the FiveAM tutorial"
  :author "Tomek 'uint' Kurcz"
  :license "GPLv3"
  :serial t
  :in-order-to ((test-op (test-op "quasirpg/tests")))
  :components ((:file "package")
               (:file "quasirpg")))


(asdf:defsystem #:quasirpg/tests
  :depends-on (:quasirpg :fiveam)
  :perform (test-op (o s)
		    (uiop:symbol-call :quasirpg-tests :test-quasi))
  :components ((:module "tests"
			:serial t
			:components ((:file "package")
				     (:file "main")
				     (:file "random-utils-tests")
				     (:file "char-gen-tests")))))
