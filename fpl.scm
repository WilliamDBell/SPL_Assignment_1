; Assignment 1
; Structures of Programming Languages
; William Bell

;#1
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

;#2
(define (sum-up-numbers-simple elemList)
    (if (null? elemList)
        0
        (if (number? (car elemList))
            (+ (car elemList) (sum-up-numbers-simple (cdr elemList)))
            (sum-up-numbers-simple (cdr elemList))
        )    
    )
)

;#3
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
        (if (number? (car L))
            (min (car L) (find-min (cdr L) currentMin))
            (find-min (cdr L) currentMin)
        )
    )        
)

;Helper function to find max number in list
(define (find-max L currentMax)
    (if (null? L)
        currentMax
        (if (number? (car L))
            (max (car L) (find-max (cdr L) currentMax))
            (find-max (cdr L) currentMax)
        )
    )
)

;Helper function to find the min value over some floor
(define (find-min L currentMin)
  (if (number? currentMin)  
      (if (null? L)
            currentMin
                (if (number? (car L))
                    (min (car L) (find-min (cdr L) currentMin))
                    (find-min (cdr L) currentMin)
                )
      )
  (find-min (cdr L) (car (cdr L)))
  )
        
)

;#4
(define (min-above-min L1 L2)
    (if (null? L1)
        #f
        (if (null? L2)
            (find-min L1 (car L1))
            (find-min-above L1 (find-min L2 (car L2)) (find-max L1 (car L1)))
        )
    )
)
