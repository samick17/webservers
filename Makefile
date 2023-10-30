MAKEFLAGS += --silent

all:
	make load-test name=node_express_server

run:
	cd ${name} && npm start &

load-test:
	make run name=${name}
	sleep 1
	mkdir -p benchmark-result
	k6 run \
		./testing/load-test.js > benchmark-result/${name}.log
	sh ./kill_server.sh
