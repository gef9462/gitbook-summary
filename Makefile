# config
bindir = ./bin
mainFile = .

# var
make_dir:=$(shell pwd)
app_name:=$(shell basename $(make_dir))

## build: Builds the project
.PHONY: build
build: 
	GOOS=linux GOARCH=amd64 go build -o $(bindir)/$(app_name) $(mainFile)
	GOOS=darwin GOARCH=amd64 go build -o $(bindir)/$(app_name).darwin $(mainFile)
	GOOS=windows GOARCH=amd64 go build -o $(bindir)/$(app_name).exe $(mainFile)

## clean: Cleans the project
.PHONY: clean
clean:
	rm -rf $(bindir)/*
	go clean

## help: Show this help info.
.PHONY: help
help: Makefile
	@printf "\nUsage: make <TARGETS> <OPTIONS> ...\n\nTargets:\n"
	@sed -n 's/^##//p' $< | column -t -s ':' | sed -e 's/^/ /'
	@echo "$$USAGE_OPTIONS