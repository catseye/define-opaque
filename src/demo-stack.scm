; usage: csi -q -b demo.scm

(load "define-opaque.scm")

(define-opaque-lousy stack make-stack (items)
  (
    (new (lambda (new-items)
      (make-stack new-items)))
    (push (lambda (item)
      (make-stack (cons item items))))
    (top (lambda ()
      (car items)))
    (pop (lambda ()
      (make-stack (cdr items))))
  )
)

(define demo (lambda ()
  (let* (
    (stack0 (stack 'new '(4 5 6)))
    (stack1 (stack0 'pop))
    (stack2 (stack1 'push 9))
    (stack3 (stack2 'pop))
    (stack4 (stack3 'push 8))
  )
    (display (stack0 'top)) (newline)
    (display (stack1 'top)) (newline)
    (display (stack2 'top)) (newline)
    (display (stack3 'top)) (newline)
    (display (stack4 'top)) (newline)
  )))

(demo)
