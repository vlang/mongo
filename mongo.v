module mongo

fn init() {
	C.mongoc_init()
}

pub fn new_client(uri string) &C.mongoc_client_t {
	return C.mongoc_client_new(uri.str)
}

pub fn (uri &C.mongoc_uri_t) new_client() &C.mongoc_client_t {
	return C.mongoc_client_new_from_uri(uri)
}

pub fn (client &C.mongoc_client_t) get_database(db_name string) &C.mongoc_database_t {
	return C.mongoc_client_get_database(client, db_name.str)
}

pub fn (database &C.mongoc_database_t) destroy() {
	C.mongoc_database_destroy(database)
}

pub fn (client &C.mongoc_client_t) get_collection(db_name string, collection_name string) &C.mongoc_collection_t {
	return C.mongoc_client_get_collection(client, db_name.str, collection_name.str)
}

pub fn (client &C.mongoc_client_t) destroy() {
	C.mongoc_client_destroy(client)
}