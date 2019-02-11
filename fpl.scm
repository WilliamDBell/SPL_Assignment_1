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
        (+ (car elemList) (sum-up-numbers-simple (cdr elemList)))
    )
)
