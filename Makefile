MAKEFLAGS += --silent

load-test:
	mkdir -p benchmark-result
	k6 --out json=benchmark-result/${name}.json run ./testing/load-test.js
