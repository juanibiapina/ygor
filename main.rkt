#lang racket

(provide (rename-out [ygor-module-begin #%module-begin]))

(define-syntax-rule (ygor-module-begin body ...)
  (#%plain-module-begin body ...))

(provide hello?)

(define-syntax-rule (hello?)
  (print "hello to you too!"))