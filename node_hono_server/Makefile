MAKEFLAGS += --silent

launch-release:
	NODE_ENV=production bun run build/index.js

build:
	rm -rf build
	bun build ./src/index.js --outdir ./build
