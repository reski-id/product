package helper

import "strconv"

func ConvertToInt(str string) int {
	val, _ := strconv.Atoi(str)
	return val
}
