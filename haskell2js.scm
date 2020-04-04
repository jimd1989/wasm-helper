; read a haskell array into js boilerplate

(import (chicken process-context) (chicken string))

(define (to-wasm α)
  (display 
    (string-append
      "w = new WebAssembly.Instance(new WebAssembly.Module(new Uint8Array("
      α 
      ")))"))
  (newline))

(to-wasm (car (command-line-arguments)))
