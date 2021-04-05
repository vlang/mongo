module mongo

pub fn cursor_next(cursor &C.mongoc_cursor_t, document &C.bson_t) bool {
	return C.mongoc_cursor_next(cursor, document)
}
