; Assignment 1
; Structures of Programming Languages
; William Bell

;Define reverse-general function
(define (reverse-general L)
    (cond ((null? L) '())
        ((list? L)
            (append (reverse-general (cdr L))
                (list (reverse-general (car L)))
            )
        )
        (else L)
    )
)

(define (sum-up-numbers-simple elemList)
    (if (null? elemList)
        0
        (if (number? (car elemList))
            (+ (car elemList) (sum-up-numbers-simple (cdr elemList)))
            (sum-up-numbers-simple (cdr elemList))
        )    
    )
)

(define (sum-up-numbers-general elemList)
    (if (null? elemList)
        0
        (if (list? (car elemList))
            (+ (sum-up-numbers-general (car elemList)) (sum-up-numbers-general (cdr elemList)))
            (if (number? (car elemList))
                (+ (car elemList) (sum-up-numbers-general (cdr elemList)))
                (sum-up-numbers-general (cdr elemList))
            )
        )      
    )
)

;Helper function to find minimum number in list
(define (find-min L currentMin)
    (if (null? L)
        currentMin
        (min (car L) (find-min (cdr L) currentMin))
    )
)

;Helper function to find max number in list
(define (find-max L currentMax)
    (if (null? L)
        currentMax
        (max (car L) (find-max (cdr L) currentMax))
    )
)

;Helper function to find the min value over some floor
(define (find-min-above L Lfloor currentMin)
    (if (null? L)
        currentMin
        (if ( and (> (car L) Lfloor) (< (car L) currentMin))
            (find-min-above (cdr L) Lfloor (car L))
            (find-min-above (cdr L) Lfloor currentMin)
        )
    )
)
