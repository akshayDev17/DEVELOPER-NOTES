package main

import (
	"fmt"
	"reflect"
	"sort"
)

type Vehicle struct {
	Name string
	Type string
}

func (v Vehicle) getName() string {
	return v.Name
}

type Car struct {
	*Vehicle
	Maxspeed float32
	Fueltype string
}

func main() {
	c := &Car{
		Vehicle: &Vehicle{
			Name: "Bazuka",
			Type: "4 wheel",
		},
		Maxspeed: 124.3,
		Fueltype: "Petrol",
	}
	fmt.Println("The name of the vehicle is:", c.getName()) //  will print Bazuka

	list_s := []string{"Hello", "Bye"}
	fmt.Println(list_s, reflect.TypeOf(list_s))
	list_s_sortSlice := sort.StringSlice(list_s)
	fmt.Println("Sort slice of list_s is:", list_s_sortSlice, " of type:", reflect.TypeOf(list_s_sortSlice))

	// // trying to sort the slice directly
	// sort.Sort(list_s) // error
	// // sort.Sort(module = sort, function = Sort) takes sort.Interface as its argument,
	// // string doesn't implement this interface, but sort.StringSlice does, hence we need
	// // this typecasting.

	// trying to sort the stringSlice
	sort.Sort(list_s_sortSlice)

	fmt.Println("Sorted slice =", list_s_sortSlice)
}
