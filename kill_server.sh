#!/usr/bin/env sh

a=$(lsof -t -i:3000)
kill -9 ${a}
