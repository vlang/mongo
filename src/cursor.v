module mongo

import json
import x.json2

@[inline]
pub fn (cursor &C.mongoc_cursor_t) next_doc(document &&C.bson_t) bool {
	return C.mongoc_cursor_next(cursor, document)
}

pub fn (cursor &C.mongoc_cursor_t) limit(limit int) &C.mongoc_cursor_t {
	C.mongoc_cursor_set_limit(cursor, limit)
	return unsafe { cursor }
}

// Get the next document parsing it with the arg struct type and setting it
pub fn (cursor &C.mongoc_cursor_t) next[T](mut t T) ?bool {
	document := new_bson()
	if !cursor.next_doc(&document) {
		return false
	}
	// declare str to avoid v errors
	str := document.str()
	t = json.decode(T, str)?
	return true
}

pub fn (cursor &C.mongoc_cursor_t) destroy() {
	C.mongoc_cursor_destroy(cursor)
}

pub fn (cursor &C.mongoc_cursor_t) lean() []json2.Any {
	if !C.mongoc_cursor_more(cursor) {
		return []
	}
	mut response := []json2.Any{}

	document := new_bson()
	reply := new_bson()

	mut error := &C.bson_error_t{}

	for C.mongoc_cursor_next(cursor, &document) {
		json_doc := document.str()
		raw_mp := json2.raw_decode(json_doc) or { continue }
		response << raw_mp.as_map()
	}

	if C.mongoc_cursor_error_document(cursor, error, &reply) {
		unsafe { println(C.bson_as_json(reply, 0).vstring()) }
		panic(error)
	}

	return response
}

pub fn (cursor &C.mongoc_cursor_t) skip(skip int) &C.mongoc_cursor_t {
	if skip == 0 || !C.mongoc_cursor_more(cursor) {
		return unsafe { cursor }
	}

	mut document := &C.bson_t{}

	mut count := skip
	for C.mongoc_cursor_next(cursor, document) {
		count--
		if count == 0 {
			break
		}
	}
	// // FIXME - it not possible set limit after .skip()
	// unsafe{println("Set try >>>>>>>>>>> ${C.mongoc_cursor_set_limit(cursor, 1)}")}

	return unsafe { cursor }
}
