MAKEFLAGS += --silent
ENV=$(shell cat .env)

dev:
	iex -S mix phx.server

build:
	MIX_ENV=prod mix release

launch-release:
	make build
	env $(ENV) ./_build/prod/rel/elixir_server/bin/elixir_server start
