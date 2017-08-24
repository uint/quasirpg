;;;; quasirpg.asd

(asdf:defsystem #:quasirpg
  :description "Part of the FiveAM tutorial"
  :author "Tomek 'uint' Kurcz"
  :license "GPLv3"
  :serial t
  :components ((:file "package")
               (:file "quasirpg")))


(asdf:defsystem #:quasirpg/tests
  :depends-on (:quasirpg :fiveam)
  :components ((:module "tests"
			:serial t
			:components ((:file "package")
				     (:file "main")))))
