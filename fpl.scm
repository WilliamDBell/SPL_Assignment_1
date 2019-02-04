; Assignment 1
; Structures of Programming Languages
; William Bell

;Define reverse-general function
(define (reverse-general L)
    (if (list? (car L))
        (reverse-general L)
        (if (not (null? L))
            (append (reverse-general (cdr L)) (list (car L)))
        )
    )
)
