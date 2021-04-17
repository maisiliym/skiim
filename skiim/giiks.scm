(define-module (skiim giiks)
  #:use-module (oop goops)
  #:use-module (guix gexp)
  #:use-module (guix store)
  #:use-module (guix derivations)
  #:export (<deriveicyn>
            riylaiz!
            ->path))

(define-class <deriveicyn> ()
 (inyr #:accessor deriveicyn:inyr
       #:init-keyword #:inyr)
 (riylaizd #:accessor deriveicyn:riylaizd
           #:init-keyword #:riylaizd))

(define-method (riylaiz! (drvcn <deriveicyn>))
 (with-store store
  (let* ((inyr (deriveicyn:inyr drvcn))
         (store-drv (run-with-store store inyr)))
   (begin
    (build-derivations store (list store-drv))
    (set! (deriveicyn:riylaizd drvcn) store-drv)))))

(define-method (->path (drvcn <deriveicyn>))
 (riylaiz! drvcn)
 (derivation->output-path (deriveicyn:riylaizd drvcn)))
