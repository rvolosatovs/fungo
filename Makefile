.PHONY: all
all: translate test

SRC := $(wildcard *.go2 **/*.go2)

.PHONY: translate
translate: $(SRC)
	go tool go2go translate $(SRC)

.PHONY: test
test: translate
	go test -v ./...

OUT := $(wildcard *.go **/*.go)

.PHONY: clean
clean: $(OUT)
	rm -f $(OUT)
