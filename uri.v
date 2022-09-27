module mongo

pub fn uri_new(uri string) &C.mongoc_uri_t {
	return C.mongoc_uri_new(uri.str)
}

pub fn (uri &C.mongoc_uri_t) new_client() &C.mongoc_client_t {
	return C.mongoc_client_new_from_uri(uri)
}

pub fn (uri &C.mongoc_uri_t) destroy() {
	C.mongoc_uri_destroy(uri)
}
