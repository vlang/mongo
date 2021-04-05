module mongo

#flag -I/usr/local/include/libbson-1.0
#flag -I/usr/local/include/libmongoc-1.0
#flag -lmongoc-1.0
#flag -lbson-1.0

#include "mongoc/mongoc.h"
#include "bson/bson.h"

pub fn init() {
	C.mongoc_init()
}

pub fn uri_new(uri_string string) &C.mongoc_uri_t {
	return C.mongoc_uri_new(uri_string.str)
}