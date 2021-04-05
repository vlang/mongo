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

pub fn uri_new(uri_string string) &C.mongoc_uri_t {
	return C.mongoc_uri_new(uri_string.str)
}

pub fn client_new_from_uri(uri_string &C.mongoc_uri_t) &C.mongoc_client_t {
	return C.mongoc_client_new_from_uri(uri_string)
}

pub fn client_get_database(client &C.mongoc_client_t, db_name string) &C.mongoc_database_t {
	return C.mongoc_client_get_database(client, db_name.str)
}
