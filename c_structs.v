module mongo

/**		MONGOC		**/

// http://mongoc.org/libmongoc/current/mongoc_client_t.html
pub struct C.mongoc_client_t {}

// http://mongoc.org/libmongoc/current/mongoc_database_t.html
pub struct C.mongoc_database_t {}

// http://mongoc.org/libmongoc/current/mongoc_collection_t.html
pub struct C.mongoc_collection_t {}

// http://mongoc.org/libmongoc/current/mongoc_uri_t.html
pub struct C.mongoc_uri_t {}

// http://mongoc.org/libmongoc/current/mongoc_cursor_t.html
pub struct C.mongoc_cursor_t {}

// http://mongoc.org/libmongoc/current/mongoc_read_prefs_t.html
pub struct C.mongoc_read_prefs_t {}


/**		BSON		**/

// http://mongoc.org/libbson/current/bson_t.html
pub struct C.bson_t {}

// http://mongoc.org/libbson/current/bson_oid_t.html
pub struct C.bson_oid_t {}

// http://mongoc.org/libbson/current/bson_subtype_t.html
pub struct C.bson_subtype_t {}

// http://mongoc.org/libbson/current/bson_context_t.html
pub struct C.bson_context_t {}

// http://mongoc.org/libbson/current/bson_subtype_t.html
pub struct C.bson_subtyper_t {}

// http://mongoc.org/libbson/current/bson_decimal128_t.html
pub struct C.bson_decimal128_t {}

// http://mongoc.org/libbson/current/bson_iter_t.html
pub struct C.bson_iter_t {}

// http://mongoc.org/libbson/current/bson_value_t.html
pub struct C.bson_value_t {}

// http://mongoc.org/libbson/current/bson_error_t.html
pub struct C.bson_error_t {}
