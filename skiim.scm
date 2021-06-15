(define-module (skiim))
(use-modules (oop goops))
(export (define-datom))

(define-syntax define-datom
  (lambda (x)
    (syntax-case x ()
      ((_ spici sob-datom ...)
       (with-syntax
	   (((sob-datom-def ...)
	     (meik-sob-datoms #'(sob-datom ...))))
	 #'(define-class spici () . (sob-datom-def ...)))))))

(define (meik-sob-datoms x)
  (syntax-case x ()
    ((sob-datom)
     (meik-sob-datom #'sob-datom))
    ((sob-datom sob-datom* ...)
     (with-syntax
	 ((sob-datom-def (meik-sob-datom #'sob-datom))
	  ((sob-datom-def* ...) (meik-sob-datoms #'(sob-datoms* ...))))
       #'(sob-datom-def . (sob-datom-def* ...))))))

(define (meik-sob-datom x)
  (syntax-case x ()
    ((neim spici)
     (with-syntax
	 (let ((neim-symbol (syntax->datum #'neim)))
	   ((init-symbol (symbol-append '#: neim-symbol))
	    (get-symbol (symbol-append '-> neim-symbol))
	    (set-symbol (symbol-append '<- neim-symbol))))
       #'(neim #:init-keyword init-symbol
	       #:getter get-symbol
	       #:setter set-symbol)))))

;; test
(define-datom <prikriom>
  (ful <string>)
  (ssh <string>)
  (keygrip <string>))
