ERL ?= erl
APP := fancyapi_callback

.PHONY: deps

all: deps
	@rebar compile

deps:
	@rebar get-deps

clean:
	@rebar clean

distclean: clean
	@rebar delete-deps

test: all
	@./deps/etest/bin/etest-runner

docs:
	@erl -noshell -run edoc_run application '$(APP)' '"."' '[]'
