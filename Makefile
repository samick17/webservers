MAKEFLAGS += --silent

all:
	make load-test name=elixir_phoenix_server
	make load-test name=go_gin_server
	make load-test name=node_express_server
	make load-test name=node_fastify_server
	make load-test name=node_koa_server
	make load-test name=node_elysia_server
	make load-test name=node_hono_server
	make load-test name=python_dash_server
	make load-test name=python_django_server
	make load-test name=python_flask_server
	make load-test name=python_hug_server
	make load-test name=rust_actix_server
	make load-test name=rust_rocket_server
	make load-test name=rust_axum_server
	make load-test name=rust_warp

run:
	cd ${name} && \
	make build
	cd ${name} && make launch-release &

load-test:
	make run name=${name}
	sleep 3
	mkdir -p benchmark-result
	k6 run \
		./testing/load-test.js > benchmark-result/${name}.log
	sh ./kill_server.sh

run-elixir-phoenix:
	k6 run \
		./testing/load-test.js > benchmark-result/elixir_phoenix_server.log

run-rust-actix:
	k6 run \
		./testing/load-test.js > benchmark-result/rust_actix_server.log

run-go-gin:
	k6 run \
		./testing/load-test.js > benchmark-result/go_gin_server.log

run-node-express:
	k6 run \
		./testing/load-test.js > benchmark-result/node_express_server.log

run-node-koa:
	k6 run \
		./testing/load-test.js > benchmark-result/node_koa_server.log

run-node-fastify:
	k6 run \
		./testing/load-test.js > benchmark-result/node_fastify_server.log

run-node-elysia:
	k6 run \
		./testing/load-test.js > benchmark-result/node_elysia_server.log

run-node-hono:
	k6 run \
		./testing/load-test.js > benchmark-result/node_hono_server.log

run-python-flask:
	k6 run \
		./testing/load-test.js > benchmark-result/python_flask_server.log

