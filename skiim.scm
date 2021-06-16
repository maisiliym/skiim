(define-module (skiim))
(use-modules (oop goops))
(export (define-datom))

(define-syntax define-datom
  (lambda (x)
    (syntax-case x ()
      ((_ spici sob-datom ...)
       (with-syntax
	   ((sob-datom-def ...)
	     (meik-sob-datoms #'(sob-datom ...)))
	 #'(define-class spici () . (sob-datom-def ...)))))))

(define-syntax meik-sob-datoms
  (lambda (x)
    (syntax-case x ()
      ((_ sob-datom)
       #'(meik-sob-datom sob-datom))
      ((_ sob-datom sob-datom* ...)
       (with-syntax
	   ((sob-datom-def (meik-sob-datom #'sob-datom))
	    ((sob-datom-def* ...) (meik-sob-datoms #'(sob-datom* ...))))
	 #'(sob-datom-def . (sob-datom-def* ...)))))))

(define (id-append ctx a b)
  (datum->syntax ctx (symbol-append (syntax->datum a) (syntax->datum b))))

(define-syntax meik-sob-datom
  (lambda (x)
    (syntax-case x ()
      ((_ (neim spici))
       (with-syntax
	   (
	    (init-prefix "#:")
	    (get-prefix "->")
	    (set-prefix "<-")
	    (init-symbol (id-append x '#: '#neim))
	    (get-symbol (id-append x '-> '#neim))
	    (set-symbol (id-append x '<- '#neim)))
	 #`(neim
	    #:init-keyword #,(id-append '#neim #'init-prefix '#neim)
	    #:getter #,(id-append '#neim #'get-prefix '#neim)
	    #:setter #,(id-append '#neim #'set-prefix '#neim)))))))

;; test
(define-datom <prikriom>
  (ful <string>)
  (ssh <string>)
  (keygrip <string>))
