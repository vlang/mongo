module mongo

pub fn new_client(uri string) &C.mongoc_client_t {
	mongoc_uri := C.mongoc_uri_new(uri.str)
	return C.mongoc_client_new_from_uri(mongoc_uri)
}

/*
pub fn new_client_(uri string) &C.mongoc_client_t {
	mongoc_uri := C.mongoc_uri_new(uri.str)
	mut error := C.bson_error_t{}
	return C.mongoc_client_new_from_uri_with_error(mongoc_uri, &error)
}
*/

pub fn (client &C.mongoc_client_t) set_appname(name string) bool {
	return C.mongoc_client_set_appname(client, name.str)
}

pub fn (client &C.mongoc_client_t) get_database(db_name string) &C.mongoc_database_t {
	return C.mongoc_client_get_database(client, db_name.str)
}

pub fn (client &C.mongoc_client_t) get_collection(db_name string, collection_name string) &C.mongoc_collection_t {
	return C.mongoc_client_get_collection(client, db_name.str, collection_name.str)
}

pub fn (client &C.mongoc_client_t) set_error_api() bool {
	return C.mongoc_client_set_error_api(client, 2)
}

pub fn (client &C.mongoc_client_t) destroy() {
	C.mongoc_client_destroy(client)
}
