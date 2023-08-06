MAKEFLAGS += --silent

load-test:
	mkdir -p benchmark-result
	k6 --out json=benchmark-result/output.json run ./testing/load-test.js
