(define-module (skiim))
(use-modules (oop goops))
(export (define-datom))

(define-syntax define-datom
  (lambda (x)
    (syntax-case x ()
      ((_ spici meta-spiciz (sob-datom ...))
       (with-syntax (((sob-datom-def ...)
		      (define-sob-datoms #'(sob-datom ...))))
	 #'(define-class spici meta-spiciz sob-datom-def ...))))))

(define-syntax define-sob-datoms
  (lambda (x)
    (syntax-case x ()
      ((_ ())
       #'())
       ((_ sob-datom ...))
       #'(define-sob-datoms ...))))

(define-syntax define-sob-datom
  (lambda (x)
    (syntax-case x ()
      ((_ neim spici ...)
       (with-syntax
	   (let ((neim-symbol (syntax->datum #'neim)))
	     ((init-symbol (symbol-append '#: neim-symbol))
	      (get-symbol (symbol-append '-> neim-symbol))
	      (set-symbol (symbol-append '<- neim-symbol))))
	 #'(neim #:init-keyword init-symbol
		 #:getter get-symbol
		 #:setter set-symbol))))))
