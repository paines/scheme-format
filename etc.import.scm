;;;; etc.import.scm - GENERATED BY CHICKEN 5.0.0 -*- Scheme -*-

(scheme#eval
  '(import-syntax scheme chicken.base chicken.string simple-loops srfi-1))
(##sys#register-compiled-module
  'etc
  'etc
  (scheme#list)
  '((cadr? . etc#cadr?)
    (car? . etc#car?)
    (curry . etc#curry)
    (defun? . etc#defun?)
    (defvar? . etc#defvar?)
    (frag . etc#frag)
    (improper-list? . etc#improper-list?)
    (indent . etc#indent)
    (length? . etc#length?)
    (list< . etc#list<)
    (symbol< . etc#symbol<)
    (typeof . etc#typeof)
    (value< . etc#value<))
  (scheme#list
    (scheme#cons
      'transform
      (syntax-rules
        ()
        ((_ xs ys body ...)
         (let loop ((xs ys))
           (if (atom? xs)
             xs
             (receive (xs ys) (begin body ...) (append xs (loop ys))))))))
    (scheme#cons
      'trace
      (syntax-rules
        ()
        ((_ f)
         (let ((g f))
           (set! f
             (lambda args
               (define r)
               (indent trace-level (current-error-port))
               (write (cons 'f args) (current-error-port))
               (newline (current-error-port))
               (inc! trace-level)
               (set! r (apply g args))
               (dec! trace-level)
               (indent trace-level (current-error-port))
               (display "-> " (current-error-port))
               (write r (current-error-port))
               (newline (current-error-port))
               r))))))
    (scheme#cons
      'map-rec
      (syntax-rules
        ()
        ((_ x xs body ...)
         (let loop ((x xs))
           (if (pair? x) (set! x (cons (loop (car x)) (loop (cdr x)))))
           (begin body ...)))))
    (scheme#cons
      'inc!
      (syntax-rules
        ()
        ((_ x) (set! x (+ x 1)))
        ((_ x delta) (set! x (+ x delta)))))
    (scheme#cons
      'for*
      (syntax-rules
        ()
        ((_ x xs ys body ...)
         (let loop ((xs ys))
           (if (atom? xs)
             xs
             (let ((x (car xs))) (cons (begin body ...) (loop (cdr xs)))))))))
    (scheme#cons
      'for
      (syntax-rules () ((_ x xs body ...) (map (lambda (x) body ...) xs))))
    (scheme#cons
      'filt
      (syntax-rules () ((_ x xs body ...) (filter (lambda (x) body ...) xs))))
    (scheme#cons
      'dec!
      (syntax-rules
        ()
        ((_ x) (set! x (- x 1)))
        ((_ x delta) (set! x (- x delta)))))
    (scheme#cons
      'debug
      (syntax-rules
        ()
        ((_ x)
         (let ((r x))
           (indent trace-level (current-error-port))
           (write 'x (current-error-port))
           (display ": " (current-error-port))
           (write r (current-error-port))
           (newline (current-error-port))
           r))))
    (scheme#cons
      'collect
      (syntax-rules
        ()
        ((_ body ...)
         (let loop ()
           (define x (begin body ...))
           (if x (append x (loop)) '())))))
    (scheme#cons
      'any-rec?
      (syntax-rules
        ()
        ((_ x xs body ...)
         (let loop ((x xs))
           (or (begin body ...)
               (and (pair? x) (or (loop (car x)) (loop (cdr x))))))))))
  (scheme#list))

;; END OF FILE
