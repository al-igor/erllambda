PROJECT := erllambda
REBAR   := ./rebar3

.PHONY: all test doc clean-doc elvis

all: compile

compile: deps
	$(REBAR) compile

test: eunit
	$(REBAR) cover
	$(REBAR) covertool generate
	cp _build/test/covertool/$(PROJECT).covertool.xml $(PROJECT).coverage.xml

deps:
	$(REBAR) deps

eunit:
	$(REBAR) eunit