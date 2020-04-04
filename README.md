## wasm-helper

I like to inspect raw webassembly as a list of 8 bit ints rather than hex. This file contains three simple Chicken Scheme functions that

- Get a wasm binary into a list of uint8 values
- Format the list as a JS/Haskell array
- Wrap the list in boilerplate needed to run wasm in the browser

They should be self-explanatory.
