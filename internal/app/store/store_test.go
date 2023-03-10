package store_test

import (
	"os"
	"testing"
)

var (
	databaseURL string
)

func TestMain(m *testing.M) {
	databaseURL = os.Getenv("DATABASE_URL")
	if databaseURL == "" {
		println(12332)
		databaseURL = "host=localhost login=postgres password=postgres dbname=postgres sslmode=disable"
	}
	os.Exit(m.Run())
}
