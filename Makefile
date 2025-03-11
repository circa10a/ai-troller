PROJECT=circa10a/ai-troller
CADDY_MODULE=github.com/jasonlovesdoggo/caddy-defender@main

build:
	xcaddy build --with $(CADDY_MODULE)
	docker build -t $(PROJECT) .

run: export TROLL_CONTENT=file://crack.txt
run: build
	./caddy run --config ./Caddyfile
