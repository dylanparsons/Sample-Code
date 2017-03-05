#lang racket

(define (circle-area rad)
   ; PRE: This functions takes The given radius must be positive ( e.g. Radius > 0)
  
   ; POST: Returns the area of a circle with given radius
   (* 3.141592 ( * rad rad ))
)
; TRY: (circle-area 10) 
(define (distance p1 p2)
   ; PRE: This function takes two 2-element lists that represent
   ; two separate points (e.g. p1 and p2)
  
   ; POST: The total distance between point one and point two is returned. 
  (sqrt (+ (sqr (- (car p1) (car p2)))
           (sqr (- (car (cdr p1)) (car(cdr p2))))))
)
; TRY: (distance '(1 2) '(2 2))
(define (midpoint p1 p2)
  ; PRE: This function takes two-element lists that represent two separate points (e.g. p1 and p2)
  
  ; POST: The midpoint of the line segment is returned as a two element list
  (append (list (/ (+ (car p1)(car p2)) 2)) (list (/ (+ (car (cdr p1)) (car (cdr p2))) 2)))
)
; TRY: (midpoint '(1 1) '(2 2))
(define (contains p1 p2 p3)
  ; PRE: This function that takes three, two-element lists, which represent two separate points of
  ; the upper-left and lower-right corners of a rectangle respectively and another point on the plane

  
  ; POST: The function should return TRUE (#t) if the third point is found within the rectangle
  ; formed by the first two points and FAlSE (#f) if otherwise
  
  (cond[(<(car p3)(car p1)) #f]
       [(>(car p3)(car p2)) #f]
       [(<(car (cdr p3))(car (cdr p1))) #f]
       [(>(car (cdr p3))(car (cdr p2))) #f]
       [else #t]
  )
)
; TRY: (contains '(1 1) '(5 5) '(6 6))
