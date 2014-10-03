#lang racket

(provide #%top-interaction
         #%app
         #%datum
         (rename-out [ygor-module-begin #%module-begin]))

(define-syntax (ygor-module-begin stx)
  (datum->syntax
     stx
     (cons (quote-syntax #%module-begin)
           (map (lambda (e)
                  (list (quote-syntax ygor-eval)
                        e))
                (cdr (syntax-e stx))))
     stx
     stx))

(provide hello?)

(define-syntax-rule (hello?)
  (print "hello to you too!"))

(provide const)
(struct const (v) #:transparent)

(provide sum)
(struct sum (e1 e2) #:transparent)

(define (ygor-eval e)
  (match e
    [(const x) (const x)]
    [(sum e1 e2) (const (+ (const-v (ygor-eval e1)) (const-v (ygor-eval e2))))]))
