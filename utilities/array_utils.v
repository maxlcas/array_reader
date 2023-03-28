module utilities

pub fn to_u8_array(array []string) []u8 {
	mut result_array := []u8{len: array.len, cap: array.len, init: 0}
	for str in array {
		result_array << str.u8()
	}
	return result_array
}
