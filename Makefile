MAKEFLAGS += --silent

all:
	make load-test name=elixir_server
	make load-test name=go_gin_server
	make load-test name=node_express_server
	make load-test name=node_fastify_server
	make load-test name=node_koa_server
# 	make load-test name=python_dash_server
# 	make load-test name=python_django_server
# 	make load-test name=python_flask_server
# 	make load-test name=python_hug_server
	make load-test name=rust_actix_server
# 	make load-test name=rust_rocket_server

run:
	cd ${name} && \
	make build && \
	make launch-release &

load-test:
	make run name=${name}
	sleep 3
	mkdir -p benchmark-result
	k6 run \
		./testing/load-test.js > benchmark-result/${name}.log
	sh ./kill_server.sh

run-elixir:
	k6 run \
		./testing/load-test.js > benchmark-result/elixir_server.log

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

