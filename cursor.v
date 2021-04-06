module mongo

pub fn (cursor &C.mongoc_cursor_t) cursor_next(document &C.bson_t) bool {
	return C.mongoc_cursor_next(cursor, document)
}
