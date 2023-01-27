; usage: csi -q -b demo.scm

(load "define-opaque.scm")

(define-opaque-lousy stack make-stack (items)
  (
    (push (lambda (args)
      (make-stack (cons (car args) items))))
    (pop (lambda (args)
      (let* ( (item (car items))
              (new-items (cdr items)) )
        (cons
          (make-stack new-items)
          item))))
  )
)

(define demo (lambda ()
  (let* (
    (result (stack 'pop '()))
    (stack2 (car result))
    (item   (cdr result))
    (stack3 (stack2 'push '(9)))
  )
    (display item)
    (newline)
    (display (stack2 'pop '()))
    (newline)
    (display (stack3 'pop '()))
    (newline)
  )))

(demo)
