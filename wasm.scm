(import srfi-1 srfi-4 (chicken string))

(define-syntax λ
  (syntax-rules () ((λ . α) (lambda α))))

(define (read-wasm α)
  (let* ((ω (open-input-file α))
         (Ω (read-u8vector #f ω)))
    (close-input-port ω)
    (u8vector->list Ω)))

(define (to-array α)
  (string-append "[" (string-intersperse (map ->string α) ",") "]"))

(define (to-wasm α)
  (string-append
    "w = new WebAssembly.Instance(new WebAssembly.Module(new Uint8Array("
    α 
    ")))"))

(define (wasm α)
  (to-wasm (to-array (read-wasm α))))
