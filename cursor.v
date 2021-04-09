module mongo

import json

[inline]
pub fn (cursor &C.mongoc_cursor_t) next_doc(document &&C.bson_t) bool {
	return C.mongoc_cursor_next(cursor, document)
}

// Get the next document parsing it with the arg structure type and setting it
pub fn (cursor &C.mongoc_cursor_t) next<T>(mut t T) ?bool {
	document := C.bson_new()
	if !cursor.next_doc(&document) {
		return false
	}
	// declare str to avoid v errors
	str := document.str()
	t = json.decode(T, str) ?
	return true
}
