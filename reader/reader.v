module reader

pub struct Reader {
	pub:
	bytes  []u8
	pub mut:
	offset int
	oob    bool
}

pub fn (mut r Reader) add_offset(size u32) {
	if !r.oob { r.offset += int(size)}
}

pub fn (mut r Reader) is_oob(size u32) {
	if r.offset + int(size) > r.bytes.len { r.oob = true }
}

