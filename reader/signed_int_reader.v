module reader

// read_i16 reads two bytes of data from reader.bytes and returns them as an i16, then increments reader.offset accordingly.
pub fn (mut reader Reader) read_i16() i16 {
	size := sizeof(i16)

	reader.is_oob(size)
	if reader.oob { return 0 }

	defer {
		reader.add_offset(sizeof(size))
	}

	bytes := reader.bytes
	offset := &reader.offset

	return bytes[*offset] |
	( i16(bytes[*offset + 0x1]) << 8  )
}

// read_i32 reads four bytes of data from reader.bytes and returns them as an i32, then increments reader.offset accordingly.
pub fn (mut reader Reader) read_i32() i32 {
	size := sizeof(i32)
	
	reader.is_oob(size)
	if reader.oob { return 0 }

	defer {
		reader.add_offset(sizeof(size))
	}

	bytes := reader.bytes
	offset := &reader.offset

	return bytes[*offset] |
	( int(bytes[*offset + 0x1]) << 8  ) |
	( int(bytes[*offset + 0x2]) << 16 ) |
	( int(bytes[*offset + 0x3]) << 24 )
}

// read_i64 reads eight bytes of data from reader.bytes and returns them as an i64, then increments reader.offset accordingly.
pub fn (mut reader Reader) read_i64() i64 {
	size := sizeof(i64)

	reader.is_oob(size)
	if reader.oob { return 0 }

	defer {
		reader.add_offset(sizeof(size))
	}

	bytes := reader.bytes
	offset := &reader.offset

	return bytes[*offset] |
	( i64(bytes[*offset + 0x1]) << 8) |
	( i64(bytes[*offset + 0x2]) << 16) |
	( i64(bytes[*offset + 0x3]) << 24) |
	( i64(bytes[*offset + 0x4]) << 32) |
	( i64(bytes[*offset + 0x5]) << 40) |
	( i64(bytes[*offset + 0x6]) << 48) |
	( i64(bytes[*offset + 0x7]) << 56)
}
