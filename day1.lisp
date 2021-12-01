;; part 1
(let ((inputs (map 'list #'parse-integer (uiop:read-file-lines "day1.input")))
      (current 0))
  (reduce (lambda (x y) (progn
                            (if (> y x)
                                (setf current (1+ current)))
                            y))
            inputs)
  (print (concatenate 'string  "Part 1: " (write-to-string current))))

;; part 2
(let ((inputs (map 'list #'parse-integer (uiop:read-file-lines "day1.input")))
      (current 0)
      (previous nil))
  (loop for i from 3 upto (length inputs) do
    (let* ((window (subseq inputs (- i 3) i))
           (window-sum (reduce #'+ window)))
      (progn
        (if (and previous (> window-sum previous))
            (setf current (1+ current)))
        (setf previous window-sum))))
  (print (concatenate 'string  "Part 2: " (write-to-string current))))
