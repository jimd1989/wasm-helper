; read a wasm binary into JS boilerplate

(import srfi-4 (chicken process-context) (chicken string))

(define (read-wasm α)
  (let* ((ω (open-input-file α))
         (Ω (read-u8vector #f ω)))
    (close-input-port ω)
    (u8vector->list Ω)))

(define (to-array α)
  (string-append "[" (string-intersperse (map ->string α) ",") "]"))

(define (to-wasm α)
  (display 
    (string-append
      "w = new WebAssembly.Instance(new WebAssembly.Module(new Uint8Array("
      α 
      ")))"))
  (newline))

(to-wasm (to-array (read-wasm (car (command-line-arguments)))))
