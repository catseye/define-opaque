(define-syntax opaque-op
  (syntax-rules ()
    ((opaque-op (name body) args)
      (apply body args))))

(define-syntax opaque-ops
  (syntax-rules ()
    ((opaque-ops target args ())
      (begin
        (display "Undefined operation ") (display target) (newline) #f))
    ((opaque-ops target args (op rest ...))
      (if (equal? (car 'op) target) (opaque-op op args) (opaque-ops target args (rest ...))))))

(define-syntax define-opaque-lousy
  (syntax-rules ()
    ((define-opaque-lousy name make-name privs ops)
      (define name
        (letrec
          (
            (make-name (lambda privs
              (lambda (target . args)
                (opaque-ops target args ops))))
          )
          (make-name '()))))))
