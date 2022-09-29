module mongo

import json
import x.json2
import time

pub fn (collection &C.mongoc_collection_t) count(filter map[string]json2.Any) i64 {
	json_data := filter.str()
	filter_bson_t := C.bson_new_from_json(json_data.str, json_data.len, 0)

	defer {
		filter_bson_t.destroy()
	}

	return C.mongoc_collection_count_documents(collection, filter_bson_t, 0, 0, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) count_from<T>(t T) i64 {
	query_bson_t := new_bson_from<T>(t)
	return C.mongoc_collection_count_documents(collection, filter, 0, 0, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) count_from_bson_t(filter &C.bson_t) i64 {
	return C.mongoc_collection_count_documents(collection, filter, 0, 0, 0, 0)
}

pub fn (collection &C.mongoc_collection_t) insert_one(document &C.bson_t) bool {
	return C.mongoc_collection_insert_one(collection, document, 0, 0, 0)
}

// TODO fix it
/*
pub fn (collection &C.mongoc_collection_t) insert_many(documents []&C.bson_t) bool {
	return C.mongoc_collection_insert_many(collection, documents.data, documents.len, 0, 0)
}
*/

pub fn (collection &C.mongoc_collection_t) find(query map[string]json2.Any) &C.mongoc_cursor_t {
	// sw := time.new_stopwatch()
	json_data := query.str()
	// mut dt := sw.elapsed().microseconds()
	// println('Elapsed time (query.str()): $dt uS') // Elapsed time (query.str()): 14 uS

	query_bson_t := C.bson_new_from_json(json_data.str, json_data.len, 0)

	defer {
		query_bson_t.destroy()
	}

	// dt = sw.elapsed().microseconds()
	// println('Elapsed time (C.bson_new_from_json): $dt uS') // Elapsed time (C.bson_new_from_json): 27 uS
	return C.mongoc_collection_find(collection, 0, 0, 0, 0, query_bson_t, unsafe { nil },
		unsafe { nil })
}

pub fn (collection &C.mongoc_collection_t) find_from<T>(t T) &C.mongoc_cursor_t {
	query_bson_t := new_bson_from<T>(t)
	return C.mongoc_collection_find(collection, 0, 0, 0, 0, query_bson_t, unsafe { nil },
		unsafe { nil })
}

pub fn (collection &C.mongoc_collection_t) find_from_bson_t(query_bson_t &C.bson_t) &C.mongoc_cursor_t {
	return C.mongoc_collection_find(collection, 0, 0, 0, 0, query_bson_t, unsafe { nil },
		unsafe { nil })
}

pub fn (collection &C.mongoc_collection_t) find_oid(oid string) &C.mongoc_cursor_t {
	query := new_bson_oid_filter(oid)
	return C.mongoc_collection_find(collection, .no_cursor_timeout, 0, 0, 0, query, 0,
		0)
}

pub fn (collection &C.mongoc_collection_t) find_with_opts(filter &C.bson_t, opts &C.bson_t) &C.mongoc_cursor_t {
	return C.mongoc_collection_find_with_opts(collection, filter, opts, 0)
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
	unsafe { C.mongoc_collection_destroy(collection) }
}

//*   sugar fn   *
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

pub fn (collection &C.mongoc_collection_t) delete(selector &C.bson_t) bool {
	return C.mongoc_collection_delete_one(collection, selector, 0, 0, 0)
}
