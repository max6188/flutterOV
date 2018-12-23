package main

import ("fmt"
        "strings")

func main() {
	e:= strings.Split("hola  amigos como", " ")

	fmt.Printf("%s ",e[0])
	fmt.Printf("%s\n",e[1])
	fmt.Printf("%s\n",e[2])
}