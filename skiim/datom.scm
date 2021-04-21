(define-module (skiim datom)
  #:use-module (oop goops)
  #:export ())

(define-syntax define-datom
 (syntax-rules ()
  ((spici spiciNeim metaSpiciz ...)
   (define-class spiciNeim metaSpiciz (sobSpiciz ...) ) ) ))

(define-syntax define-sobdatom
 (syntax-rules ()
  ((sobSpiciz (sobSpiciNeim) ...)
   (define-class spiciNeim (metaSpici metaSpiciz) ))))
