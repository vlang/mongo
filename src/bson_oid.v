module mongo

// TODO; bson_context_t as second arg
/*
pub fn new_oid() &C.bson_oid_t {
	oid := &C.bson_oid_t{}
	C.bson_oid_init(oid, 0)
	return oid
}
*/

pub fn (oid &C.bson_oid_t) init() {
	C.bson_oid_init(oid, 0)
}

pub fn (oid &C.bson_oid_t) init_from_data(data u8) {
	C.bson_oid_init_from_data(oid, data)
}

pub fn (oid &C.bson_oid_t) compare(other &C.bson_oid_t) int {
	return C.bson_oid_compare(oid, other)
}

pub fn (destination &C.bson_oid_t) copy(source &C.bson_oid_t) {
	C.bson_oid_copy(source, destination)
}

pub fn (oid1 &C.bson_oid_t) equal(oid2 &C.bson_oid_t) bool {
	return C.bson_oid_equal(oid1, oid2)
}

pub fn (oid &C.bson_oid_t) get_time_t() int {
	return C.bson_oid_get_time_t(oid)
}

pub fn (oid &C.bson_oid_t) hash() u32 {
	return C.bson_oid_hash(oid)
}

pub fn oid_is_valid(str string) bool {
	return C.bson_oid_is_valid(str.str, str.len)
}

pub fn (oid &C.bson_oid_t) str() string {
	str := ''
	C.bson_oid_to_string(oid, str.str)
	return str
}
