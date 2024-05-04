MAKEFLAGS += --silent
ENV=$(shell cat .env)

init:
	env $(ENV) mix deps.get

dev:
	iex -S mix phx.server

build:
	MIX_ENV=prod mix release

launch-release:
	env $(ENV) ./_build/prod/rel/elixir_server/bin/elixir_server start
