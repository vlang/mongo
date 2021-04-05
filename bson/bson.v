module bson

pub fn new() &C.bson_t {
	return C.bson_new()
}

pub fn new_from_json(json_data string) &C.bson_t {
	return C.bson_new_from_json(json_data.str, -1, 0)
}

pub fn destroy(document &C.bson_t) {
	C.bson_destroy(document)
}

pub fn free(mem voidptr) {
	C.bson_free(mem)
}

pub fn as_canonical_extended_json(document &C.bson_t) string {
	return unsafe {
		C.bson_as_canonical_extended_json(document, 0).vstring()
	}
}

pub fn as_json(document &C.bson_t) string {
	return unsafe {
		C.bson_as_json(document, 0).vstring()
	}
}

pub fn as_relaxed_extended_json(document &C.bson_t) string {
	return unsafe {
		C.bson_as_relaxed_extended_json(document, 0).vstring()
	}
}

pub fn init_from_json(document &C.bson_t, json_data string) bool {
	return C.bson_init_from_json(document, json_data.str, -1, 0)
}

pub fn compare(bson &C.bson_t, other &C.bson_t) int {
	return C.bson_compare(bson, other)
}

pub fn concat(destination &C.bson_t, source &C.bson_t) bool {
	return C.bson_concat(destination, source)
}

pub fn copy(document &C.bson_t) &C.bson_t {
	return C.bson_copy(document)
}

pub fn copy_to(source &C.bson_t, destination &C.bson_t) {
	C.bson_copy_to(source, destination)
}

pub fn copy_to_excluding(source &C.bson_t, destination &C.bson_t, exclude string) {
	C.bson_copy_to_excluding(source, destination, exclude.str)
}

pub fn count_keys(document &C.bson_t) int {
	return int(C.bson_count_keys(document))
}

pub fn equal(document &C.bson_t, other &C.bson_t) bool {
	return C.bson_equal(document, other)
}

pub fn get_data(document &C.bson_t) byte {
	return C.bson_get_data(document)
}

pub fn has_field(document &C.bson_t, field string) bool {
	return C.bson_has_field(document, field.str)
}
