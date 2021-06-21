(define-module (skiim))
(use-modules (oop goops))
(export define-datom)

(define-syntax define-datom
  (lambda (x)
    (define (meik-sob-datom sd)
      (define (id-append ctx a b)
	(datum->syntax ctx (symbol-append (string->symbol a) (syntax->datum b))))
      (syntax-case sd ()
	((neim spici)
	 (with-syntax
	     ((init-symbol (id-append #'neim "#:" #'neim))
	      (get-symbol (id-append #'neim "->" #'neim))
	      (set-symbol (id-append #'neim "<-" #'neim)))
	   #`(neim
	      #:init-keyword init-symbol
	      #:getter get-symbol
	      #:setter set-symbol)))))    
    (define (meik-sob-datoms sds)
      (syntax-case sds ()
	(() #'())
	((sob-datom)
	 (meik-sob-datom #'sob-datom))
	((sob-datom sob-datom* ...)
	 (with-syntax
	     ((sob-datom-def (meik-sob-datom #'sob-datom))
	      ((sob-datom-def* ...) (meik-sob-datoms #'(sob-datom* ...))))
	   #'(sob-datom-def sob-datom-def* ...)))))
    (syntax-case x ()
      ((_ spici sob-datom sob-datom* ...)
       (with-syntax
	   ((sob-datom-def (meik-sob-datom #'sob-datom))
	    (sob-datom-defs (meik-sob-datoms #'(sob-datom* ...))))
	 #'(define-class spici () sob-datom-def sob-datom-defs))))))

;; test
(define-datom <prikriom>
  (ful <string>)
  (ssh <string>)
  (keygrip <string>))
