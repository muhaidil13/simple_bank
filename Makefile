
init:
	migrate create -ext sql -dir db/migrations -seq init_schema
migrateup: 
	migrate -path db/migrations -database "postgresql://root:root@localhost:5432/simple_bank?sslmode=disable" -verbose up
migratedown: 
	migrate -path db/migrations -database "postgresql://root:root@localhost:5432/simple_bank?sslmode=disable" -verbose down
postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres:17
removecontainer:
	docker stop postgres
	docker rm postgres
createdb:
	docker exec -it postgres createdb --username=root --owner=root simple_bank
dropdb:
	docker exec -it postgres dropdb simple_bank
sqlc:
	sqlc generate
test:
	go test -v -cover ./...
.PHONY: postgres createdb removecontainer dropdb migrateup migratedown sqlc
