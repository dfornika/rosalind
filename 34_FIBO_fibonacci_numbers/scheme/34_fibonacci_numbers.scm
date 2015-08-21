#!/usr/local/bin/guile -s
!#
(use-modules (ice-9 rdelim))

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(let ((n (string->number (read-line))))
  (write-line (fib n)))

