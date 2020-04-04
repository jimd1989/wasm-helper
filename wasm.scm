; general functions for interactive inspection of wasm

(import srfi-1 srfi-4 (chicken string))

(define (read-wasm α)
  (let* ((ω (open-input-file α))
         (Ω (read-u8vector #f ω)))
    (close-input-port ω)
    (u8vector->list Ω)))

(define (from-array α)
  (map string->number
       (string-split
         (string-translate* α '(("," . " ") ("[" . "") ("]" . ""))))))

(define (drop-headers α)
  (drop α 8))

(define (this-section α)
  (let ((ω (+ 2 (cadr α))))
    (take α ω)))

(define (next-section α)
  (let ((ω (+ 2 (cadr α))))
    (drop α ω)))

(define (find-section α ω)
  (if (= (car ω) α) ω (find-section α (next-section ω))))

(define (goto α ω)
  (this-section (find-section α (drop-headers ω))))

(define (signatures α) (goto 1 α))
(define (types α)      (goto 3 α))
(define (memory α)     (goto 5 α))
(define (exports α)    (goto 7 α))
(define (code α)       (goto 10 α))
