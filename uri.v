module mongo

pub fn uri_new(uri string) &C.mongoc_uri_t {
	return C.mongoc_uri_new(uri.str)
}

pub fn (uri &C.mongoc_uri_t) destroy() {
	C.mongoc_uri_destroy(uri)
}