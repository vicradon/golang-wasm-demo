package main

import (
	"fmt"
	"os"
	"strconv"
)

func wasmSum(num1, num2 int) int {
	return num1 + num2
}

func main() {
	fmt.Println("Hello Golang!")

	args := os.Args[1:]

	if len(args) <= 1 {
		fmt.Println("Pass two numbers to sum")
	}

	if len(args) > 1 {

		allIntegers := true
		for _, arg := range args {
			_, err := strconv.Atoi(arg)
			if err != nil {
				allIntegers = false
			}
		}

		if allIntegers {
			num1, _ := strconv.Atoi(args[0])
			num2, _ := strconv.Atoi(args[1])

			sum := wasmSum(num1, num2)

			fmt.Println("The sum of", num1, "and", num2, "is", sum)
		}
	}
}
