module mongo

#flag -I @VMODROOT/thirdparty/libbson-1.0
#flag -I @VMODROOT/thirdparty/libmongoc-1.0
#flag -l mongoc-1.0
#flag -l bson-1.0

#include "mongoc/mongoc.h"
#include "bson/bson.h"

// http://mongoc.org/libmongoc/current/mongoc_client_t.html
@[typedef]
pub struct C.mongoc_client_t {}

// http://mongoc.org/libmongoc/current/mongoc_client_pool_new.html
@[typedef]
pub struct C.mongoc_client_pool_t {}

// http://mongoc.org/libmongoc/current/mongoc_database_t.html
@[typedef]
pub struct C.mongoc_database_t {}

// http://mongoc.org/libmongoc/current/mongoc_collection_t.html
@[typedef]
pub struct C.mongoc_collection_t {}

// http://mongoc.org/libmongoc/current/mongoc_write_concern_t.html
@[typedef]
pub struct C.mongoc_write_concern_t {}

// http://mongoc.org/libmongoc/current/mongoc_uri_t.html
@[typedef]
pub struct C.mongoc_uri_t {}

// http://mongoc.org/libmongoc/current/mongoc_cursor_t.html
@[typedef]
pub struct C.mongoc_cursor_t {}

// http://mongoc.org/libmongoc/1.17.0/mongoc_query_flags_t.html
@[typedef]
pub struct C.mongoc_query_flags_t {}

// http://mongoc.org/libmongoc/current/mongoc_read_prefs_t.html
@[typedef]
pub struct C.mongoc_read_prefs_t {}

// http://mongoc.org/libmongoc/current/mongoc_stream_t.html
@[typedef]
pub struct C.mongoc_stream_t {}

// http://mongoc.org/libmongoc/current/mongoc_stream_file_t.html
@[typedef]
pub struct C.mongoc_stream_file_t {}

// https://mongoc.org/libmongoc/current/mongoc_bulk_operation_t.html
@[typedef]
pub struct C.mongoc_bulk_operation_t {}
