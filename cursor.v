module mongo

pub fn (cursor &C.mongoc_cursor_t) next(document &C.bson_t) bool {
	return C.mongoc_cursor_next(cursor, document)
}
