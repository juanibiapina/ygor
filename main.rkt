#lang racket

(provide hello?
         (rename-out [ygor-module-begin #%module-begin]))

(define-syntax-rule (ygor-module-begin body ...)
  (#%plain-module-begin body ...))

(define-syntax-rule (hello?)
  (print "hello to you too!"))