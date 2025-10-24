#lang racket

; --- MODE (first part copied from the pdf like it provides) ---


;the mode copied from the pdf file
(define prompt?
   (let [(args (current-command-line-arguments))]
     (cond
       [(= (vector-length args) 0) #t]
       [(string=? (vector-ref args 0) "-b") #f]
       [(string=? (vector-ref args 0) "--batch") #f]
       [else #t])))


;making error variable
(define ERROR-PREFIX "Error: ")

;prints depending on batch mode or not
(define (print-output-line output)
  (if prompt?
      (displayln output)
      (display output)
      ))
;prints out error msg (if there is one)
(define (print-error-line error-msg)
  (print-output-line (string-append ERROR-PREFIX " " error-msg)))

;acts like scanner from java. prompts user
(define (prompt-user)
  (if prompt?
      (begin (display "> ") (read-line))
      (read-line)
      ))

;i think theres a problem with the memory. will check later.
;ok literally next day i checked it and its fine??????? whatever
;
(define (get-history-value history id)
  (let ((index (- id 1)))
    (if (and (>= index 0) (< index (length history)))
        (list-ref history index)
        'invalid-id)))

;-----------------------------READER------------------------------------


;reader method
(define (reader tokens history)
  (if (null? tokens)
      (list 'error "Empty expression.")
      (let* ((token (car tokens))
             (rest-tokens (cdr tokens)))

        (cond
          ;if number
          ((string->number token)
           => (lambda (num) (list (real->double-flonum num) rest-tokens)))

          ;checks histroy
          ((and (char=? #\$ (string-ref token 0)) 
                (string->number (substring token 1 (string-length token))))
           => (lambda (id)
                (let ((value (get-history-value history id)))
                  (if (equal? value 'invalid-id)
                      (list 'error (string-append "Invalid history ID: $" (number->string id)))
                      (list value rest-tokens)))))

          ;checks if the number is negative
          ((string=? token "-")
           (let ((result-pair (reader rest-tokens history)))
             (if (equal? 'error (car result-pair))
                 result-pair
                 (let ((val (car result-pair))
                       (remaining (cadr result-pair)))
                   (list (- val) remaining)))))

;onto the the expressions
;checks if the next token is either additive multiplicative or division
((or (string=? token "+") (string=? token "*") (string=? token "/"))
 (let ((result1-pair (reader rest-tokens history)))
   (if (equal? 'error (car result1-pair))
       result1-pair
       (let* ((val1 (car result1-pair)) 
              (tokens-after-val1 (cadr result1-pair))
              (result2-pair (reader tokens-after-val1 history)))
         (if (equal? 'error (car result2-pair))
             result2-pair
             (let ((val2 (car result2-pair))
                   (remaining (cadr result2-pair)))
               (cond
                 
                 ((and (string=? token "/") (= val2 0.0)) 
                  (list 'error "Division by zero."))

                 ;after getting the rest of the variables
                 ((string=? token "+") (list (+ val1 val2) remaining))
                 ((string=? token "*") (list (* val1 val2) remaining))
                 ((string=? token "/") 
                  (list (real->double-flonum (floor (/ val1 val2))) remaining)) 
                  
                 (else (list 'error "Internal operator error."))
                 )))))))

          
          (else
           (list 'error (string-append "Invalid token: " token))))))); anything else is invalid

;; --- LOOPER ------------------------------------------

;checks user input for errors
(define (parse-and-eval expression-str history)
  (let* ((tokens (regexp-split #rx"[ \t\n]+" expression-str))
         (clean-tokens (filter (lambda (s) (not (string=? s ""))) tokens)))

    (if (null? clean-tokens)
        history
        
        (let ((result-pair (reader clean-tokens history)))
          
          (if (equal? 'error (car result-pair))
              (begin
                (print-error-line "Invalid Expression")
                history)
              
              (let ((result (car result-pair))
                    (remaining-tokens (cadr result-pair)))
                
                (if (not (null? remaining-tokens))
                    
                    (begin
                      (print-error-line "Invalid Expression (Extra text remaining)")
                      history)
                    
                    
                    (let ((new-history-id (+ (length history) 1)))
                      
                      (let ((result-flonum result))
                        
                        
                        (print-output-line (string-append (number->string new-history-id) ": " (number->string result-flonum)))
                        
                        
                        (cons result-flonum history)
                        ))))))))) ;

;initiates everything, uses prompt user
(define (main-loop history)
  (let ((input (prompt-user)))
    (cond
      
      ((string=? input "quit") (void))
      
      (else
       (let ((new-history (parse-and-eval input history)))
         (main-loop new-history))))))

;starts with empty list
(main-loop '())