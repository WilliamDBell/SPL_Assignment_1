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
