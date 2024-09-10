# Makefile for building WASM output for both WASI (app.wasm) and browser (browser.wasm)

WASI_DIR = wasi

BROWSER_SRC = main.go
WASI_SRC = $(WASI_DIR)/main.go

WASI_OUTPUT = $(WASI_DIR)/app.wasm
BROWSER_OUTPUT = web/browser.wasm

GO = go

.PHONY: all wasi browser clean

all: wasi browser

wasi: $(WASI_SRC)
	@mkdir -p $(WASI_DIR)
	GOOS=wasip1 GOARCH=wasm $(GO) build -o $(WASI_OUTPUT) $(WASI_SRC)
	@echo "WASI app.wasm built at $(WASI_OUTPUT)"

browser: $(BROWSER_SRC)
	GOOS=js GOARCH=wasm $(GO) build -o $(BROWSER_OUTPUT) $(BROWSER_SRC)
	@echo "Browser browser.wasm built at $(BROWSER_OUTPUT)"

clean:
	@rm -rf $(BROWSER_OUTPUT) $(WASI_OUTPUT)
	@echo "Cleaned up the build artifacts"