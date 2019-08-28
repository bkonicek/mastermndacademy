package main

import "fmt"

func imTheMan(name string) string {
  return fmt.Sprintf("I am %v!", name)
}

func main() {
    fmt.Println(imTheMan("Ben"))
}

