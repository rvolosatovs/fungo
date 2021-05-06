.PHONY: all
all: translate test

.PHONY: translate
translate: $(shell find . -type f -name '*.go2' -printf '%P\n')
	go tool go2go translate internal/test/*.go2
	go tool go2go translate *.go2
	go tool go2go translate result/*.go2
	go tool go2go translate maybe/*.go2
	go tool go2go translate collections/*.go2
	go tool go2go translate slices/*.go2
	go tool go2go translate chans/*.go2
	go tool go2go translate maps/*.go2
	go tool go2go translate collections/collections_test/*.go2

.PHONY: test
test: translate
	go test -v ./...

OUT := $(shell find . -type f -name '*.go' -printf '%P\n')

.PHONY: clean
clean: $(OUT)
	rm -f $(OUT)
