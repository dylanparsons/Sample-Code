#lang racket

(define-namespace-anchor a)
(define local (namespace-anchor->namespace a))

; Utilities for breadth-First search

(define (buildRecord s p c w)
  ; Pre: s is a state, p is the parent state of s, c is the cost and w is the
  ;      heuristic value at s
  ; Post: The 4-element list (s p c w) is returned
  (list s p c w)
)

(define (getState r)
  ; Pre: r is a 4-element list making a state
  ; Post: The state in r is returned
  (car r)
)

(define (getParent r)
  ; Pre: r is a 4-element list making a state
  ; Post: The parent in r is returned
  (cadr r)
)

(define (getCost r)
  ; Pre: r is a 4-element list making a state
  ; Post: The depth of r is returned
  (caddr r)
)

(define (getWeight r)
  ; Pre: r is a 4-element list making a state
  ; Post: The heuristic at r is returned
  (cadddr r)
)

(define (findRecord s rl)
  ; Pre: s is a state and rl is a list of state records
  ; Post: The record whose state is s has been returned if it exits.
  ;       Otherwise () has been returned.
  (cond ((null? rl) #f)
        ((equal? s (getState (car rl))) (car rl))
        (#t (findRecord s (cdr rl)))
  )
)

(define (buildSolution s)
  ; Pre:  s is a state
  ; Post: The list of s's ancestors has been returned
  (cond ((null? s) '())
        (#t (append (list s) (buildSolution (getParent (findRecord s *closed*)))))
  )
)

(define (removeIt x L)
  ; Pre: x is an element and L is a list
  ; Post: The remaining list when all instances of x have been 
  ;       removed from L has been returned.'
  (cond ((null? L) '())
        ; IF L is null then you're done
        ((equal? (car L) x) (removeIt x (cdr L)))
        ; ELSE IF the first element of L is x then discard it
        (#t (append (list(car L)) (removeIt x (cdr L))))
        ; OTHERWISE stick the first element to what's left when 
        ;           x has been removed from the rest of L
   )
)
;*******************************************************************************
; Utilities for the Tile Puzzle Problem.

(define (findEmpty s)
  ; Pre: s is a state
  ; Post: Returns the Position of the empty space.
  (cond [(equal? (list-ref s 0) '_) '1]
        [(equal? (list-ref s 1) '_) '2]
        [(equal? (list-ref s 2) '_) '3]
        [(equal? (list-ref s 3) '_) '4]
        [(equal? (list-ref s 4) '_) '5]
        [(equal? (list-ref s 5) '_) '6]
        [(equal? (list-ref s 6) '_) '7]))

(define (swap firstIndex secondIndex l)
  ;Pre: This function takes a list that contains firstIndex and secondIndex
  ;Post: Returns a list of swapped elements that represent firstIndex and secondIndex.
  (define (build-list l index element1 element2)
    (cond ((null? l)
           '())
          ((= index firstIndex)
           (cons element2 (build-list (cdr l) (add1 index) element1 element2)))
          ((= index secondIndex)
           (cons element1 (build-list (cdr l) (add1 index) element1 element2)))
          (else
           (cons (car l) (build-list (cdr l) (add1 index) element1 element2)))))
  (build-list l 0 (list-ref l firstIndex) (list-ref l secondIndex)))


(define (cost x y)
  ;Pre: This function takes twos lists that contain the child (x) and parent (y) states
  ;Post: Returns a cost of 1 or 2 between the parent and child states/
  (cond ((or (equal? (- (findEmpty x) (findEmpty y)) 2) (equal? (- (findEmpty x) (findEmpty y)) -2)) 2)
        (#t 1)))


;*******************************************************************************
; The moves

(define (leftOne s)
  ;Pre: s is a state
  ;Post: Returns a list with the space moved one to the left. 
  (cond [(equal? (findEmpty s) '1) '()]
        [(equal? (findEmpty s) '2) (swap 0 1 s)]
        [(equal? (findEmpty s) '3) (swap 1 2 s)]
        [(equal? (findEmpty s) '4) (swap 2 3 s)]
        [(equal? (findEmpty s) '5) (swap 3 4 s)]
        [(equal? (findEmpty s) '6) (swap 4 5 s)]
        [(equal? (findEmpty s) '7) (swap 5 6 s)]))
  

(define (leftTwo s)
  ;Pre: s is a state
  ;Post: Returns a list with the space moved two to the left.
  (cond [(equal? (findEmpty s) '1) '()]
        [(equal? (findEmpty s) '2) '()]
        [(equal? (findEmpty s) '3) (swap 0 2 s)]
        [(equal? (findEmpty s) '4) (swap 1 3 s)]
        [(equal? (findEmpty s) '5) (swap 2 4 s)]
        [(equal? (findEmpty s) '6) (swap 3 5 s)]
        [(equal? (findEmpty s) '7) (swap 4 6 s)]))
  

(define (leftThree s)
  ;Pre: s is the state
  ;Post: Returns a list with the space moved three to the left.
  (cond [(equal? (findEmpty s) '1) '()]
        [(equal? (findEmpty s) '2) '()]
        [(equal? (findEmpty s) '3) '()]
        [(equal? (findEmpty s) '4) (swap 0 3 s)]
        [(equal? (findEmpty s) '5) (swap 1 4 s)]
        [(equal? (findEmpty s) '6) (swap 2 5 s)]
        [(equal? (findEmpty s) '7) (swap 3 6 s)]))
 
  
(define (rightOne s)
  ;Pre: s is the state
  ;Post: Returns a list with the space moved one to the right.
  (cond [(equal? (findEmpty s) '1) (swap 0 1 s)]
        [(equal? (findEmpty s) '2) (swap 1 2 s)]
        [(equal? (findEmpty s) '3) (swap 2 3 s)]
        [(equal? (findEmpty s) '4) (swap 3 4 s)]
        [(equal? (findEmpty s) '5) (swap 4 5 s)]
        [(equal? (findEmpty s) '6) (swap 5 6 s)]
        [(equal? (findEmpty s) '7) '()]))


(define (rightTwo s)
  ;Pre: s is the state
  ;Post: Returns a list with the space moved two to the right.
  (cond [(equal? (findEmpty s) '1) (swap 0 2 s)]
        [(equal? (findEmpty s) '2) (swap 1 3 s)]
        [(equal? (findEmpty s) '3) (swap 2 4 s)]
        [(equal? (findEmpty s) '4) (swap 3 5 s)]
        [(equal? (findEmpty s) '5) (swap 4 6 s)]
        [(equal? (findEmpty s) '6) '()]
        [(equal? (findEmpty s) '7) '()]))
  

(define (rightThree s)
  ;Pre: s is the state
  ;Post: Returns a list with the space moved three to the right.
  (cond [(equal? (findEmpty s) '1) (swap 0 3 s)]
        [(equal? (findEmpty s) '2) (swap 1 4 s)]
        [(equal? (findEmpty s) '3) (swap 2 5 s)]
        [(equal? (findEmpty s) '4) (swap 3 6 s)]
        [(equal? (findEmpty s) '5) '()]
        [(equal? (findEmpty s) '6) '()]
        [(equal? (findEmpty s) '7) '()]))


;*******************************************************************************
; Initializations

(define *start* '(b b b _ w w w))
; The start state with all black tiles on left and white
; on right with an empty space in the center. 

(define *goal* '(w w w _ b b b))
; The goal state with all black and white tiles on alternate
; sides with the empty space in the center

(define *open* '())
; States that need to be visited

(define *closed* '())
; What states have we visited

(define *moves* '())
; List of possible moves


;*******************************************************************************
; Generating child nodes for the Tile Puzzle problem
(set! *moves* '(leftOne leftTwo leftThree
                             rightOne rightTwo rightThree))

(define (genKids s d m)
  ; Pre: s is a state, d is its cost, and m is a list of moves
  ; Post: A list of the new safe child states paired with their parent has been returned
  (cond ((null? m) '())
        ; While there are still moves to make
        (#t (let ((child (apply (eval (car m) local) (list s)))
                  (rst (genKids s d (cdr m))))
            ; Generate the first child and the rest of the children
              
                    ; If child is in the rest of the list, or on the open 
                    ; or closed lists ignore it
               (cond ((null? child) rst)
                    ((findRecord child rst) rst)
                    ((findRecord child *open*) rst)
                    ((findRecord child *closed*) rst)
                    ; Append the records for the child and its
                    ; parent to the list
                    (#t (cond [(equal? (cost child s) 2) (append (list (buildRecord child s (+ 2 d) (calcWeight child))) rst)]
                              [#t (append (list (buildRecord child s (+ 1 d) (calcWeight child))) rst)]) )
               )
            ) ;end let
        )
  )
)


;*******************************************************************************
; best-First Search
(define (MyMatch x y)
  ; Post: Returns 0 if x == y and 1 otherwise
  (cond ((equal? x y) 0)
        (#t 1)
  )
)

(define (calcWeight s)
  ; Pre: s is a state
  ; Post: The number of objects out of place has been returned.
  (+ (MyMatch (car s) (car *goal*))
     (MyMatch (cadr s) (cadr *goal*))
     (MyMatch (caddr s) (caddr *goal*))
     (MyMatch (cadddr s) (cadddr *goal*))
     (MyMatch (car (cddddr s)) (car (cddddr *goal*)))
     (MyMatch (cadr (cddddr s)) (cadr (cddddr *goal*)))
     (MyMatch (caddr (cddddr s)) (caddr (cddddr *goal*)))
  )
)

(define (evalState sr)
  ; Pre: sr is a state record
  ; Post: The evaluation of the state has been returned
  (+ (getCost sr) (getWeight sr))
)

(define (getBestState bsf rl)
  ; Pre: rl is a list of state records and bsf is the best-so-far
  ; Post: The state record with the lowest evaluation value has been returned
  (cond ((null? rl) bsf)
        ((<= (evalState bsf) (evalState (car rl))) (getBestState bsf (cdr rl)))
        (#t (getBestState (car rl) (cdr rl)))
  )
)


(define (bestFirst)
  ; Post:  Applies the best-First search
  
  ; Print the open and closed lists on each call
  (display "open = ")
  (display *open*)
  (newline)
  (display "closed = ")
  (display *closed*)
  (newline)
  (newline)

  ; While there are states on the open list
  (cond ((null? *open*)'())
        ; Get the best state from open
        (#t (let ((state (getBestState (car *open*) (cdr *open*))))
              ; Put it on closed
               (set! *closed* (append (list state) *closed*))
              ; If its the goal, build the solution path
               (cond ((equal? (getState state) *goal*) (buildSolution *goal*))
                     ; Append the children to the BACK of the open list
                     (#t (set! *open* (append (removeIt state *open*) 
                                              (genKids (getState state) (getCost state) *moves*)))
                         (bestFirst)
                     )
               )
            )
         )
    )
)

(define (runbest s g d h)
  ; Pre: s is a start state and g is a goal
  ; Post: A breadth-First search for g starting at a has been performed and if successful the path
  ;       has been returned.
  (set! *open* (list (buildRecord s '() d h)))
  (bestFirst)
)

;*******************************************************************************
; DO IT!
(display (reverse (runbest *start* *goal* 0 (calcWeight *start*))))