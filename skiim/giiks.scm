(define-module (giiks)
  #:use-module (oop goops)
  #:use-module (guix gexp)
  #:use-module (guix store)
  #:use-module (guix derivations)
  #:export (Deriveicyn
            riylaiz!
            ->path))

(define-class Deriveicyn ()
 (inyr #:accessor Deriveicyn:inyr
       #:init-keyword #:inyr)
 (riylaizd #:accessor Deriveicyn:riylaizd
           #:init-keyword #:riylaizd))

(define-method (riylaiz! (drvcn Deriveicyn))
 (with-store store
  (let* ((inyr (Deriveicyn:inyr drvcn))
         (store-drv (run-with-store store inyr)))
   (begin
    (build-derivations store (list store-drv))
    (set! (Deriveicyn:riylaizd drvcn) store-drv)))))

(define-method (->path (drvcn Deriveicyn))
 (riylaiz! drvcn)
 (derivation->output-path (Deriveicyn:riylaizd drvcn)))
