#lang racket

(provide (rename-out [ygor-module-begin #%module-begin]))

(define-syntax-rule (ygor-module-begin body ...)
  (#%plain-module-begin body ...))