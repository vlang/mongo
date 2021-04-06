module mongo

pub fn (collection &C.mongoc_collection_t) count_documents(filter &C.bson_t) i64 {
	return C.mongoc_collection_count_documents(collection, filter, 0, 0, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) insert_one(document &C.bson_t) bool {
	return C.mongoc_collection_insert_one(collection, document, 0, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) find_with_opts(filter &C.bson_t) &C.mongoc_cursor_t {
	return C.mongoc_collection_find_with_opts(collection, filter, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) update_one(selector &C.bson_t, update &C.bson_t) bool {
	return C.mongoc_collection_update_one(collection, selector, update, 0, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) delete_one(selector &C.bson_t) bool {
	return C.mongoc_collection_delete_one(collection, selector, 0, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) destroy() {
	C.mongoc_collection_destroy(collection)
}
