package main

import (
  "fmt"
  "strconv"
)

func fizzbuzz(num int) string {
    if num%15 == 0 {
        return "FizzBuzz"
    } else if num%3 == 0 {
        return "Fizz"
    } else if num%5 == 0 {
        return "Buzz"
    } else {
        return strconv.Itoa(num)
    }
}

func main() {
    countTo := 100
    for i := 1; i <= countTo; i++ {
        fmt.Println(fizzbuzz(i))
    }
}

