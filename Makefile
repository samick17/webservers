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
