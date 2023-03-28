module reader

pub fn (mut reader Reader) read_i32() i32 {
	defer {
		reader.offset += int(sizeof(i32))
	}

	bytes := reader.bytes
	offset := &reader.offset

	return bytes[*offset] |
	( int(bytes[*offset + 0x1]) << 8  ) |
	( int(bytes[*offset + 0x2]) << 16 ) |
	( int(bytes[*offset + 0x3]) << 24 )
}

pub fn (mut reader Reader) read_i64() i64 {
	defer {
		reader.offset += int(sizeof(i64))
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
