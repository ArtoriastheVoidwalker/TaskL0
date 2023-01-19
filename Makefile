build:
	go build -v ./cmd/server
	./server

start:
	go run ./cmd/server/main.go

test:
	go test -v -race -timeout 30s ./...

migration:
	migrate -path ./schema -database "postgres://postgres:postgres@localhost:5432/l0?sslmode=disable" up

filling:
	go run filling.go

nats:
	nats-streaming-server -cid prod -store file -dir store
