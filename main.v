import reader
import utilities

import encoding.hex { decode }
import os

fn main() {
	array_type := os.input("Will you be using a hex array or denary array? [1, 2]\n")
	match array_type {
		"1" { hexadecimal_conversion()! }
		"2" { denary_conversion() }
		else {  }
	}
}

fn denary_conversion()  {
	denary_array_str := os.input('Enter your array, with spaces seperating it\n')
	denary_array := utilities.to_u8_array(denary_array_str.split(' '))

	mut r := reader.Reader {
		bytes: denary_array
		offset: 0
	}

	println(r.read_i32())
	println(r.read_u32())
	println(r.read_i64())
	println(r.read_u64())
	println(r.read_i16())
	println(r.read_u16())

	os.input('')
}

fn hexadecimal_conversion() ! {
	hex_array_str := os.input('Enter your array, with spaces seperating it\n')
	hex_array := decode(hex_array_str.replace(' ', ''))!

	mut r := reader.Reader {
		bytes: hex_array
		offset: 0
	}

	println(r.read_i32())
	println(r.read_u32())
	println(r.read_i64())
	println(r.read_u64())
	println(r.read_i16())
	println(r.read_u16())

	os.input('')
}
