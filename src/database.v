module mongo

[inline]
pub fn (database &C.mongoc_database_t) write_command_with_opts(command &C.bson_t, opts &C.bson_t, result &C.bson_t) bool {
	return C.mongoc_database_write_command_with_opts(database, command, opts, result,
		0)
}

[inline]
pub fn (database &C.mongoc_database_t) create_collection(collection string) &C.mongoc_collection_t {
	return C.mongoc_database_create_collection(database, collection.str, 0, 0)
}

[inline]
pub fn (database &C.mongoc_database_t) get_collections() &C.mongoc_cursor_t {
	return C.mongoc_database_find_collections_with_opts(database, 0)
}

[inline]
pub fn (database &C.mongoc_database_t) add_user(user string, pass string, roles &C.bson_t) bool {
	return C.mongoc_database_add_user(database, user.str, pass.str, 0, 0, 0)
}

[inline]
pub fn (database &C.mongoc_database_t) add_user_opts(user string, pass string, roles &C.bson_t, custom_data &C.bson_t) bool {
	return C.mongoc_database_add_user(database, user.str, pass.str, roles, custom_data,
		0)
}

[inline]
pub fn (database &C.mongoc_database_t) drop() bool {
	return C.mongoc_database_drop(database, 0)
}

[inline]
pub fn (database &C.mongoc_database_t) destroy() {
	C.mongoc_database_destroy(database)
}
