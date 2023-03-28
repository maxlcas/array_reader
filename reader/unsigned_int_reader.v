module reader

pub fn (mut reader Reader) read_u32() u32 {
	defer {
		reader.offset += int(sizeof(u32))
	}

	bytes := reader.bytes
	offset := &reader.offset

	return bytes[*offset] |
	( u32(bytes[*offset + 0x1]) << 8  ) |
	( u32(bytes[*offset + 0x2]) << 16 ) |
	( u32(bytes[*offset + 0x3]) << 24 )
}

pub fn (mut reader Reader) read_u64() u64 {
	defer {
		reader.offset += int(sizeof(u64))
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
