(use-modules (ice-9 rdelim))
(use-modules (ice-9 hash-table))

(define base-counts
  (alist->hash-table '((A . 0) (C . 0) (G . 0) (T . 0))))

(define (print-bases hash)
  (display (hash-ref hash 'A))
  (display " ")
  (display (hash-ref hash 'C))
  (display " ")
  (display (hash-ref hash 'G))
  (display " ")
  (display (hash-ref hash 'T))
  (newline))

(define (count-base base)
  (let ((base-symbol (string->symbol (string base))))
    (let ((new-count (+ 1 (hash-ref base-counts base-symbol)) ))
      (hash-set! base-counts base-symbol new-count))))

(define (main args)
  (define infile
    (open-input-file (cadr (command-line))))
  (define s
    (read-line infile))

  (string-for-each count-base s)
  
  (print-bases base-counts)

  (close-port infile)
)


