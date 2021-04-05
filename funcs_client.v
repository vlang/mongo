module mongo

pub fn client_new_from_uri(uri_string &C.mongoc_uri_t) &C.mongoc_client_t {
	return C.mongoc_client_new_from_uri(uri_string)
}

pub fn client_get_database(client &C.mongoc_client_t, db_name string) &C.mongoc_database_t {
	return C.mongoc_client_get_database(client, db_name.str)
}

pub fn client_get_collection(client &C.mongoc_client_t, db_name string, collection_name string) &C.mongoc_collection_t {
	return C.mongoc_client_get_collection(client, db_name.str, collection_name.str)
}
