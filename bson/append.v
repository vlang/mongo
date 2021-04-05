module bson

pub fn append_array(document &C.bson_t, key string, array &C.bson_t) bool {
	return C.bson_append_array(document, key.str, -1, array)
}

pub fn append_array_begin(document &C.bson_t, key string, array_begin &C.bson_t) bool {
	return C.bson_append_array_begin(document, key.str, -1, array_begin)
}

pub fn append_array_end(document &C.bson_t, array_begin &C.bson_t) bool {
	return C.bson_append_array_end(document, array_begin)
}

/*
// TODO fix
pub fn append_binary(document &C.bson_t, key string, subtype C.bson_subtype_t, binary &byte, length u32) bool {
	return C.bson_append_binary(document, key.str, -1, subtype, binary, length)
}
*/

pub fn append_bool(document &C.bson_t, key string, value bool) bool {
	return C.bson_append_bool(document, key.str, -1, value)
}

pub fn append_code(document &C.bson_t, key string, code string) bool {
	return C.bson_append_code(document, key.str, -1, code.str)
}

pub fn append_code_with_scope(document &C.bson_t, key string, value string, context &C.bson_t) bool {
	return C.bson_append_code_with_scope(document, key.str, -1, value.str, context)
}

pub fn append_date_time(document &C.bson_t, key string, timestamp i64) bool {
	return C.bson_append_date_time(document, key.str, -1, timestamp)
}

pub fn append_decimal128(document &C.bson_t, key string, decimal128 &C.bson_decimal128_t) bool {
	return C.bson_append_decimal128(document, key.str, -1, decimal128)
}

pub fn append_document(document &C.bson_t, key string, adocument &C.bson_t) bool {
	return C.bson_append_document(document, key.str, -1, adocument)
}

pub fn append_document_begin(document &C.bson_t, key string, adocument &C.bson_t) bool {
	return C.bson_append_document_begin(document, key.str, -1, adocument)
}

pub fn append_document_end(document &C.bson_t, adocument &C.bson_t) bool {
	return C.bson_append_document_end(document, adocument)
}

pub fn append_double(document &C.bson_t, key string, value f64) bool {
	return C.bson_append_double(document, key.str, -1, value)
}

pub fn append_int32(document &C.bson_t, key string, value int) bool {
	return C.bson_append_int32(document, key.str, -1, value)
}

pub fn append_int64(document &C.bson_t, key string, value i64) bool {
	return C.bson_append_int64(document, key.str, -1, value)
}

pub fn append_maxkey(document &C.bson_t, key string) bool {
	return C.bson_append_maxkey(document, key.str, -1)
}

pub fn append_minkey(document &C.bson_t, key string) bool {
	return C.bson_append_minkey(document, key.str, -1)
}

pub fn append_now_utc(document &C.bson_t, key string) bool {
	return C.bson_append_now_utc(document, key.str, -1)
}

pub fn append_null(document &C.bson_t, key string) bool {
	return C.bson_append_null(document, key.str, -1)
}

pub fn append_oid(document &C.bson_t, key string, oid &C.bson_oid_t) bool {
	return C.bson_append_oid(document, key.str, -1, oid)
}

pub fn append_regex(document &C.bson_t, key string, regex string, options string) bool {
	return C.bson_append_regex(document, key.str, -1, regex.str, options.str)
}


pub fn append_symbol(document &C.bson_t, key string, symbol string) bool {
	return C.bson_append_symbol(document, key.str, -1, symbol.str, -1)
}

pub fn append_time_t(document &C.bson_t, key string, time_t u32) bool {
	return C.bson_append_time_t(document, key.str, -1, time_t)
}

pub fn append_timestamp(document &C.bson_t, key string, timestamp u32, increment u32) bool {
	return C.bson_append_timestamp(document, key.str, -1, timestamp, increment)
}

pub fn append_undefined(document &C.bson_t, key string) bool {
	return C.bson_append_undefined(document, key.str, -1)
}

pub fn append_utf8(document &C.bson_t, key string, value string) bool {
	return C.bson_append_utf8(document, key.str, -1, value.str, -1)
}

pub fn append_value(document &C.bson_t, key string, value &C.bson_value_t) bool {
	return C.bson_append_value(document, key.str, -1, value)
}
