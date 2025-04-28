package utils

import (
	"math/rand"
	"strings"
	"time"
)

const alpabet = "abcdefghijklmnopqrstuvwxyz"

func init() {
	rand.Seed(time.Now().UnixNano())
}

func RandomInt(min, max int64) int64 {
	return min + rand.Int63n(max-min+1)
}

func RandomString(n int) string {
	var sb strings.Builder

	k := len(alpabet)

	for i := 0; i < n; i++ {
		c := alpabet[rand.Intn(k)]
		sb.WriteByte(c)
	}

	return sb.String()
}

func RandomOwner() string {
	return RandomString(6)
}
func RandomMoney() int64 {
	return RandomInt(100, 99999)
}

func RandomCurrency() string {
	currency := []string{"ID", "USD", "CAD"}
	n := len(currency)
	return currency[rand.Intn(n)]
}
