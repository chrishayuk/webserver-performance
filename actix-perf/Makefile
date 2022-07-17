release:
	cargo build --release

docker:
	docker build -t chrishayuk/actix-perf .

podman:
	podman build -t chrishayuk/actix-perf .

clean:
	@echo "Cleaning up..."
	rm ./target/*
