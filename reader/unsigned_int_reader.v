module reader

// read_u16 reads two bytes of data from reader.bytes and returns them as an u16, then increments the offset accordingly.
pub fn (mut reader Reader) read_u16() u16 {
	size := sizeof(u16)

	reader.is_oob(size)
	if reader.oob { return 0 }

	defer {
		reader.add_offset(size)
	}

	bytes := reader.bytes
	offset := &reader.offset

	return bytes[*offset] |
	( u16(bytes[*offset + 0x1]) << 8  )
}

// read_u32 reads four bytes of data from reader.bytes and returns them as an u32, then increments reader.offset accordingly.
pub fn (mut reader Reader) read_u32() u32 {
	size := sizeof(u32)

	reader.is_oob(size)
	if reader.oob { return 0 }

	defer {
		reader.add_offset(size)
	}


	bytes := reader.bytes
	offset := &reader.offset

	return bytes[*offset] |
	( u32(bytes[*offset + 0x1]) << 8  ) |
	( u32(bytes[*offset + 0x2]) << 16 ) |
	( u32(bytes[*offset + 0x3]) << 24 )
}

// read_u64 reads four bytes of data from reader.bytes and returns them as an u64, then increments reader.offset accordingly.
pub fn (mut reader Reader) read_u64() u64 {
	size := sizeof(u64)

	reader.is_oob(size)
	if reader.oob { return 0 }

	defer {
		reader.add_offset(size)
	}

	bytes := reader.bytes
	offset := &reader.offset

	return bytes[*offset] |
	( u64(bytes[*offset + 0x1]) << 8) |
	( u64(bytes[*offset + 0x2]) << 16) |
	( u64(bytes[*offset + 0x3]) << 24) |
	( u64(bytes[*offset + 0x4]) << 32) |
	( u64(bytes[*offset + 0x5]) << 40) |
	( u64(bytes[*offset + 0x6]) << 48) |
	( u64(bytes[*offset + 0x7]) << 56)
}
