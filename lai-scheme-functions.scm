; Emotion detection helper functions for Loving AI project

; List of detected emotions
(define emotions '())

; Add an emotion to the list of detected emotion
(define-public (register-emotion emo)
    (set! emotions (cons emo emotions))
    (True)
)

; Returns dialogue text about detected emotions
; within a ConceptNode.
(define-public (detected-emotions)
    ; Pull the emotion names from list of WordNodes
    (define emos (map cog-name emotions))
    (define emotions-string)
    (if (> (length emos) 2)
        (set! emos (list-head emos 2))
    )
    (set! emotions-string
        (if (not (null? emos))
            (if (eq? (length emos) 1)
                (car emos)
                (string-append
                    (string-join (list-head emos (- (length emos) 1)) ", ")
                    ", or " (list-ref emos (- (length emos) 1))
                )
            )
            ""
        )
    )
    (Concept emotions-string)
)

; Clear the list of detected emotions
(define-public (clear-detected-emotions)
    (set! emotions '())
    (True)
)
