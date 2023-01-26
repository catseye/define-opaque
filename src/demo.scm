(load "define-opaque.scm")

(define-opaque-lousy stack make-stack (items)
  (
    (push (item)
      (make-stack (cons item items)))
    (pop ()
      (let* ( (item (car items))
              (new-items (cdr items)) )
        (cons
          (make-stack new-items)
          item)))
  )
)

(define demo (lambda ()
  (let* (
    (result (stack 'pop '()))
    (stack2 (car result))
    (item   (cdr result))
  )
    (display item)
    (newline)
    (stack2 'pop '()))))
