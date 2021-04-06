module bson

// TODO; bson_context_t as second arg
pub fn oid_init(oid &C.bson_oid_t) {
	C.bson_oid_init(oid, C.NULL)
}

pub fn oid_compare(oid &C.bson_oid_t, other &C.bson_oid_t) int {
	return C.bson_oid_compare(oid, other)
}

pub fn oid_copy(source &C.bson_oid_t, destination &C.bson_oid_t) {
	C.bson_oid_copy(source, destination)
}

pub fn oid_equal(oid1 &C.bson_oid_t, oid2 &C.bson_oid_t) bool {
	return C.bson_oid_equal(oid1, oid2)
}

pub fn oid_get_time_t(oid &C.bson_oid_t) int {
	return C.bson_oid_get_time_t(oid)
}

pub fn oid_hash(oid &C.bson_oid_t) u32 {
	return C.bson_oid_hash(oid)
}

pub fn oid_init_from_data(oid &C.bson_oid_t, data byte) {
	C.bson_oid_init_from_data(oid, data)
}

pub fn oid_is_valid(str string) bool {
	return C.bson_oid_is_valid(str.str, str.len)
}

pub fn oid_to_string(oid &C.bson_oid_t, str &string) {
	C.bson_oid_to_string(oid, str)
}
