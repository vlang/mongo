module mongo

#flag -I/usr/local/include/libbson-1.0
#flag -I/usr/local/include/libmongoc-1.0
#flag -lmongoc-1.0
#flag -lbson-1.0

#include "mongoc/mongoc.h"
#include "bson/bson.h"

fn init_() {
	C.mongoc_init()
}


pub fn new_client(uri_str string) &C.mongoc_client_t {
	uri := C.mongoc_uri_new(uri_str.str)
	return C.mongoc_client_new_from_uri(uri)
}

pub fn uri_new(uri string) &C.mongoc_uri_t {
	return C.mongoc_uri_new(uri.str)
}

pub fn new_client_from_uri(uri_string &C.mongoc_uri_t) &C.mongoc_client_t {
	return C.mongoc_client_new_from_uri(uri_string)
}

pub fn (client &C.mongoc_client_t) client_get_database(db_name string) &C.mongoc_database_t {
	return C.mongoc_client_get_database(client, db_name.str)
}

pub fn (client &C.mongoc_client_t) client_get_collection(db_name string, collection_name string) &C.mongoc_collection_t {
	return C.mongoc_client_get_collection(client, db_name.str, collection_name.str)
}