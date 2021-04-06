module bson

pub fn (document &C.bson_t) append_array(key string, array &C.bson_t) bool {
	return C.bson_append_array(document, key.str, -1, array)
}

pub fn (document &C.bson_t) append_array_begin(key string, array_begin &C.bson_t) bool {
	return C.bson_append_array_begin(document, key.str, -1, array_begin)
}

pub fn (document &C.bson_t) append_array_end(array_begin &C.bson_t) bool {
	return C.bson_append_array_end(document, array_begin)
}

// TODO fix
//pub fn (document &C.bson_t) append_binary(key string, subtype C.bson_subtype_t, binary &byte, length u32) bool {
//	return C.bson_append_binary(document, key.str, -1, subtype, binary, length)
//}

pub fn (document &C.bson_t) append_bool(key string, value bool) bool {
	return C.bson_append_bool(document, key.str, -1, value)
}

pub fn (document &C.bson_t) append_code(key string, code string) bool {
	return C.bson_append_code(document, key.str, -1, code.str)
}

pub fn (document &C.bson_t) append_code_with_scope(key string, value string, context &C.bson_t) bool {
	return C.bson_append_code_with_scope(document, key.str, -1, value.str, context)
}

pub fn (document &C.bson_t) append_date_time(key string, timestamp i64) bool {
	return C.bson_append_date_time(document, key.str, -1, timestamp)
}

pub fn (document &C.bson_t) append_decimal128(key string, decimal128 &C.bson_decimal128_t) bool {
	return C.bson_append_decimal128(document, key.str, -1, decimal128)
}

pub fn (document &C.bson_t) append_document(key string, adocument &C.bson_t) bool {
	return C.bson_append_document(document, key.str, -1, adocument)
}

pub fn (document &C.bson_t) append_document_begin(key string, adocument &C.bson_t) bool {
	return C.bson_append_document_begin(document, key.str, -1, adocument)
}

pub fn (document &C.bson_t) append_document_end(adocument &C.bson_t) bool {
	return C.bson_append_document_end(document, adocument)
}

pub fn (document &C.bson_t) append_double(key string, value f64) bool {
	return C.bson_append_double(document, key.str, -1, value)
}

pub fn (document &C.bson_t) append_int32(key string, value int) bool {
	return C.bson_append_int32(document, key.str, -1, value)
}

pub fn (document &C.bson_t) append_int64(key string, value i64) bool {
	return C.bson_append_int64(document, key.str, -1, value)
}

pub fn (document &C.bson_t) append_maxkey(key string) bool {
	return C.bson_append_maxkey(document, key.str, -1)
}

pub fn (document &C.bson_t) append_minkey(key string) bool {
	return C.bson_append_minkey(document, key.str, -1)
}

pub fn (document &C.bson_t) append_now_utc(key string) bool {
	return C.bson_append_now_utc(document, key.str, -1)
}

pub fn (document &C.bson_t) append_null(key string) bool {
	return C.bson_append_null(document, key.str, -1)
}

pub fn (document &C.bson_t) append_oid(key string, oid &C.bson_oid_t) bool {
	return C.bson_append_oid(document, key.str, -1, oid)
}

pub fn (document &C.bson_t) append_regex(key string, regex string, options string) bool {
	return C.bson_append_regex(document, key.str, -1, regex.str, options.str)
}

pub fn (document &C.bson_t) append_symbol(key string, symbol string) bool {
	return C.bson_append_symbol(document, key.str, -1, symbol.str, -1)
}

pub fn (document &C.bson_t) append_time_t(key string, time_t u32) bool {
	return C.bson_append_time_t(document, key.str, -1, time_t)
}

pub fn (document &C.bson_t) append_timestamp(key string, timestamp u32, increment u32) bool {
	return C.bson_append_timestamp(document, key.str, -1, timestamp, increment)
}

pub fn (document &C.bson_t) append_undefined(key string) bool {
	return C.bson_append_undefined(document, key.str, -1)
}

pub fn (document &C.bson_t) append_utf8(key string, value string) bool {
	return C.bson_append_utf8(document, key.str, -1, value.str, -1)
}

pub fn (document &C.bson_t) append_value(key string, value &C.bson_value_t) bool {
	return C.bson_append_value(document, key.str, -1, value)
}
