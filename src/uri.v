module mongo

pub fn uri_new(uri string) &C.mongoc_uri_t {
	return C.mongoc_uri_new(uri.str)
}

// // useless
// pub fn (uri &C.mongoc_uri_t) new_client() &C.mongoc_client_t {
// 	mut error := C.bson_error_t{}
// 	client := C.mongoc_client_new_from_uri_with_error(uri, &error)
// 	unsafe{println('error.message: $error.message.vstring()')}
// 	return client
// }

pub fn (uri &C.mongoc_uri_t) destroy() {
	C.mongoc_uri_destroy(uri)
}
