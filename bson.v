module mongo

import json

//TODO rename to new() when move it to submodule bson
pub fn new_bson() &C.bson_t {
	return C.bson_new()
}

pub fn new_from_json(json_data string) &C.bson_t {
	return C.bson_new_from_json(json_data.str, -1, 0)
}

pub fn to_json<T>(t T) &C.bson_t {
	return C.bson_new_from_json(json.encode(t).str, -1, 0)
}

pub fn (document &C.bson_t) destroy() {
	C.bson_destroy(document)
}

pub fn free(mem voidptr) {
	C.bson_free(mem)
}

pub fn (document &C.bson_t) as_canonical_extended_json() string {
	return unsafe {
		C.bson_as_canonical_extended_json(document, 0).vstring()
	}
}

pub fn (document &C.bson_t) str() string {
	return unsafe {
		C.bson_as_json(document, 0).vstring()
	}
}

pub fn (document &C.bson_t) as_json() string {
	return unsafe {
		C.bson_as_json(document, 0).vstring()
	}
}

pub fn (document &C.bson_t) as_relaxed_extended_json() string {
	return unsafe {
		C.bson_as_relaxed_extended_json(document, 0).vstring()
	}
}

pub fn (document &C.bson_t) init_from_json(json_data string) bool {
	return C.bson_init_from_json(document, json_data.str, -1, 0)
}

pub fn (document &C.bson_t) compare(other &C.bson_t) int {
	return C.bson_compare(document, other)
}

pub fn (destination &C.bson_t) concat(source &C.bson_t) bool {
	return C.bson_concat(destination, source)
}

pub fn (document &C.bson_t) copy() &C.bson_t {
	return C.bson_copy(document)
}

pub fn (source &C.bson_t) copy_to(destination &C.bson_t) {
	C.bson_copy_to(source, destination)
}

pub fn (source &C.bson_t) copy_to_excluding(destination &C.bson_t, exclude string) {
	C.bson_copy_to_excluding(source, destination, exclude.str)
}

pub fn (document &C.bson_t) count_keys() int {
	return int(C.bson_count_keys(document))
}

pub fn (document &C.bson_t) get_data() byte {
	return C.bson_get_data(document)
}

pub fn (document &C.bson_t) has_field(field string) bool {
	return C.bson_has_field(document, field.str)
}

pub fn (document &C.bson_t) equal(b &C.bson_t) bool {
	return C.bson_equal(document, b)
}