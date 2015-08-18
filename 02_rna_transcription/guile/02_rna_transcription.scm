(use-modules (ice-9 rdelim))

(define (dna2rna base)
  (if (char=? base #\T)
      #\U
      base))

(define (main args)
  (define infile
    (current-input-port))
    
  (define s
    (read-line infile))

  (write-line (string-map dna2rna s))

  (close-port infile)
)


