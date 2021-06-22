(define-module (skiim))
(use-modules (oop goops))
(export define-datom)

(define-syntax define-datom
  (lambda (x)
    (define (meik-sob-datom sd)
      (define (id-append ctx a b)
	(datum->syntax
	 ctx (symbol-append (string->symbol a) (syntax->datum b))))
      (syntax-case sd ()
	((neim spici)
	 (with-syntax
	     ((init-symbol (id-append #'neim "#:" #'neim))
	      (get-symbol (id-append #'neim "->" #'neim))
	      (set-symbol (id-append #'neim "<-" #'neim)))
	   #'(neim #:init-keyword init-symbol
		   #:getter get-symbol
		   #:setter set-symbol)))))
    (syntax-case x ()
      ((_ spici sob-datom)
       (with-syntax
	   ((sob-datom-def (meik-sob-datom #'sob-datom)))
	 #'(define-class spici () sob-datom-def)))
      ((_ spici sob-datom ...)
       (with-syntax
	   (((sob-datom-def ...)
	     (map (lambda (sd)
		    (meik-sob-datom sd))
		  #'(sob-datom ...))))
	 #`(define-class spici () sob-datom-def ...))))))

;; tests
(define-datom <mono-datom>
  (sob-dat <string>))

(define-datom <duo-datom>
  (one-dat <string>)
  (two-dat <string>))

(define-datom <prikriom>
  (ful <string>)
  (ssh <string>)
  (keygrip <string>)
  (test <string>))
