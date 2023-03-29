module reader

pub struct Reader {
	pub:
	bytes  []u8
	pub mut:
	offset int
	oob    bool
}

// add_offset Increments the offset of the reader passed by the 'size' argument, while ensuring it isn't going out of bounds.
pub fn (mut r Reader) add_offset(size u32) {
	if !r.oob { r.offset += int(size)}
}

// is_oob checks if adding 'size' to the current 'offset' of reader would be out of bounds of 'reader.bytes'
pub fn (mut r Reader) is_oob(size u32) {
	if r.offset + int(size) > r.bytes.len { r.oob = true }
}

