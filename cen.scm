(define-module (skiim datom)
  #:use-module (oop goops)
  #:export ())

(define-syntax define-datom
 (syntax-rules ()
  ((spici spici-neim meta-spiciz ...)
   (define-class spici-neim meta-spiciz (sob-spiciz ...) ) ) ))

(define-syntax define-sobdatom
 (syntax-rules ()
  ((sob-spiciz (sob-spici-neim) ...)
   (define-class spici-neim (meta-spici meta-spiciz) ))))
