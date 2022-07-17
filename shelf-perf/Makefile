all: server

server:
	dart compile exe ./bin/shelf_perf.dart -o ./build/shelf-perf

docker:
	docker build -t chrishayuk/shelf-perf .

#docker_x64:
#	docker build --platform linux/x86_64 -t chrishayuk/dartserve .

clean:
	@echo "Cleaning up..."
	rm ./build/*
