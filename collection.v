module mongo

import json

pub fn (collection &C.mongoc_collection_t) count_documents(filter &C.bson_t) i64 {
	return C.mongoc_collection_count_documents(collection, filter, 0, 0, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) insert_one(document &C.bson_t) bool {
	return C.mongoc_collection_insert_one(collection, document, 0, 0, 0)
}

//TODO fix it
/*
pub fn (collection &C.mongoc_collection_t) insert_many(documents []&C.bson_t) bool {
	return C.mongoc_collection_insert_many(collection, documents.data, documents.len, 0, 0)
}
*/

pub fn (collection &C.mongoc_collection_t) find(query &C.bson_t) &C.mongoc_cursor_t {
	return C.mongoc_collection_find(collection, .no_cursor_timeout, 0, 0, 0, query, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) find_oid(oid string) &C.mongoc_cursor_t {
	query := new_bson_oid_filter(oid)
	return C.mongoc_collection_find(collection, .no_cursor_timeout, 0, 0, 0, query, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) find_with_opts(filter &C.bson_t) &C.mongoc_cursor_t {
	return C.mongoc_collection_find_with_opts(collection, filter, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) replace_one(selector &C.bson_t, update &C.bson_t) bool {
	return C.mongoc_collection_replace_one(collection, selector, update, 0, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) replace_one_opts(selector &C.bson_t, update &C.bson_t, opts &C.bson_t) bool {
	return C.mongoc_collection_replace_one(collection, selector, update, opts, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) update_one(selector &C.bson_t, update &C.bson_t) bool {
	return C.mongoc_collection_update_one(collection, selector, update, 0, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) delete_one(selector &C.bson_t) bool {
	return C.mongoc_collection_delete_one(collection, selector, 0, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) create_bulk_operation() &C.mongoc_bulk_operation_t {
	return C.mongoc_collection_create_bulk_operation_with_opts(collection, 0)
}

pub fn (collection &C.mongoc_collection_t) destroy() {
	C.mongoc_collection_destroy(collection)
}


/**   sugar fn   **/
pub fn (collection &C.mongoc_collection_t) insert<T>(t T) bool {
	json_str := json.encode(t)
	document := C.bson_new_from_json(json_str.str, json_str.len, 0)
	return C.mongoc_collection_insert_one(collection, document, 0, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) replaceone<T>(oid string, t T) bool {
	selector := new_bson_oid_filter(oid)
	return collection.replace<T>(selector, t)
}

pub fn (collection &C.mongoc_collection_t) replace<T>(selector &C.bson_t, t T) bool {
	json_str := json.encode(t)
	document := C.bson_new_from_json(json_str.str, json_str.len, 0)
	return C.mongoc_collection_replace_one(collection, selector, document, 0, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) replace_opts<T>(selector &C.bson_t, opts &C.bson_t, t T) bool {
	json_str := json.encode(t)
	document := C.bson_new_from_json(json_str.str, json_str.len, 0)
	return C.mongoc_collection_replace_one(collection, selector, document, opts, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) update<T>(selector &C.bson_t, t T) bool {
	json_str := json.encode(t)
	document := C.bson_new_from_json(json_str.str, json_str.len, 0)
	return C.mongoc_collection_update_one(collection, selector, document, 0, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) update_opts<T>(selector &C.bson_t, opts &C.bson_t, t T) bool {
	json_str := json.encode(t)
	document := C.bson_new_from_json(json_str.str, json_str.len, 0)
	return C.mongoc_collection_update_one(collection, selector, document, opts, 0, 0)
}