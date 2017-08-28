;;;; quasirpg.lisp

(in-package #:quasirpg)

(defclass player-character ()
  ((name :initarg :name :reader name)
   (stats :initarg :stats :reader stats)))

(defmethod print-object ((player player-character) stream)
  (format t "- ~a -~%" (name player))
  (loop for k being the hash-key using (hash-value v) of (stats player) do
       (format t "~a: ~a~%" k v))
  (terpri))

(defun roll-dice (n sides &key (echo nil))
  "Roll N dice of SIDES sides."
  (if (< n 1)
      (error 'simple-type-error
	     :expected-type '(integer 1)
	     :datum n
	     :format-control "~@<Attempted to throw dice ~a times.~:>"
	     :format-arguments (list n)))
  (let ((result (loop for i from 1 to n summing (1+ (random (floor sides))))))
    (if echo (format t "Rolling ~ad~a! Result: ~a~%" n sides result))
    result))

(defun roll-stats (favored)
  "Generate a new set of stats, represented as a hash table. FAVORED
is a list of two strings designating stats the player favors."
  (let ((new-stats (make-hash-table)))
    (loop for stat in '("str" "dex" "con" "int" "wis") do
	 (setf (gethash stat new-stats)
	       (if (member stat favored :test #'equal)
		   (roll-dice 3 8)
		   (roll-dice 2 8))))
    new-stats))

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun make-character (&optional name favored)
  (let ((name name)
	(favored favored))
    (unless name
      (setf name (prompt-read "Choose thy name")))
    (unless favored
      (setf favored (list (prompt-read "Choose a favored stat")
			  (prompt-read "Choose another favored stat"))))
    (make-instance 'player-character :name name :stats (roll-stats favored))))
