#lang racket

;pre: This funcation takes a list and checks determines if it is an atom
;post: Returns #t if the list is an atom or #f if it is a list with many elements
(define (atom? X)
  (cond ((and (not (null? X)) (not (pair? X))) #t)
        (#t #f)))

;pre: X is a list that the car is the element you want to substitute and cdr is the element in the list that will be changed
;post: Returns a list that if Y contains cdr X (remainder of the list) is now car of X (first element of the list)
(define (try-substitution X Y)
  (cond [(null? Y) '()]
        [(null? X) Y]
        [(atom? Y) Y]
        [(equal? (cdr X) (car Y)) (cons (car X) (try-substitution X (cdr Y)))]
        [else (cons (try-substitution X (car Y)) (try-substitution X (cdr Y)))])) 

;pre: X and Y are a list
;post: returns a list of A and B 
(define (composition X Y)
  (append  X Y))

;pre: X is a list
;post: returns true if X is a pair. Also the car of X is the string VAR and it isn't null (checked for being a variable)
(define (isVariable? X)
  (cond [(and (pair? X) (eqv? (car X) 'VAR) (null? (cddr X)))]
  [else #f]))


;pre: X is a list or an element of a list.
;post: returns true if X is not null or a pair, e.g. a constant
(define (isConstant? X)
  (cond [(and (not (null? X)) (pair? X)) #f]
        [else #t]))

;pre: Takes two predicate calculus sentences where the variables are a list that begins with VAR
;post: Returns the list of substitutions or the string "fail" to represent a failed unification 
(define (unification X Y)
  (cond [(or (and (null? X) (null? Y)) (and (isConstant? X) (isConstant? Y))) (cond [(equal? X Y) '()]
                                            [else 'fail])]        
        [(isVariable? X) (cond [(member X (list Y)) 'fail]
                      [else (cons Y X) (append (cons Y (append '(/) (cdr X))) L)])]        
        [(isVariable? Y) (cond [(member Y (list X)) 'fail]
                      [else (cons X  Y) (append (cons X (append '(/) (cdr Y))) L) ])]     
        [(or (null? X) (null? Y)) 'fail]        
        [else (unification (car X) (car Y))
              (cond [(equal? (unification (car X) (car Y)) 'fail) 'fail]
                    [else (try-substitution (unification (car X) (car Y)) (cdr X))
                          (try-substitution (unification (car X) (car Y)) (cdr Y))
                          (unification (try-substitution (unification (car X) (car Y)) (cdr X)) 
                                  (try-substitution (unification (car X) (car Y)) (cdr Y)))
                          (cond [(equal?  (unification (try-substitution (unification (car X) (car Y)) (cdr X)) 
                                  (try-substitution (unification (car X) (car Y)) (cdr Y))) 'fail) 'fail]
                                [else (composition (unification (car X) (car Y)) (unification
                                 (try-substitution (unification (car X) (car Y)) (cdr X)) 
                                  (try-substitution (unification (car X) (car Y)) (cdr Y)))) ])]) ]))
              
; Empty list of substitutions
(define L '())

; Unification Lists for test purposes

; {a/y , b/X}
(define x1 '(p a (f (VAR X))))
(define x2 '(p (VAR Y) (f b)))

; fails...both elements are constants
(define y1 '(p (VAR X) (VAR X)))
(define y2 '(p (a b)))

; {a/X , Y/Z}
(define z1 '(p (VAR X) (VAR Y)))
(define z2 '(p a (f (VAR Z))))