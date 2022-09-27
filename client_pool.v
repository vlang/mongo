module mongo

[inline]
pub fn (uri &C.mongoc_uri_t) new_client_pool() &C.mongoc_client_pool_t {
	return C.mongoc_client_pool_new(uri)
}

[inline]
pub fn (pool &C.mongoc_client_pool_t) pop_client() &C.mongoc_client_t {
	return C.mongoc_client_pool_pop(pool)
}

[inline]
pub fn (pool &C.mongoc_client_pool_t) push_client(client &C.mongoc_client_t) {
	C.mongoc_client_pool_push(pool, client)
}

[inline]
pub fn (pool &C.mongoc_client_pool_t) destroy() {
	C.mongoc_client_pool_destroy(pool)
}
