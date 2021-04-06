module mongo

#flag -I @VROOT/thirdparty/mongoc
#flag @VROOT/thirdparty/libmongoc-1.0.so
#include <mongoc.h>

/**		MONGOC		**/
fn C.mongoc_init() voidptr
fn C.mongoc_uri_new(byteptr) &C.mongoc_uri_t

fn C.mongoc_client_new() &C.mongoc_client_t
fn C.mongoc_client_new_from_uri(byteptr) &C.mongoc_client_t
fn C.mongoc_client_set_appname() voidptr
fn C.mongoc_client_get_collection(&C.mongoc_client_t, byteptr, byteptr) &C.mongoc_collection_t
fn C.mongoc_client_get_database(&C.mongoc_client_t, byteptr) &C.mongoc_database_t
fn C.mongoc_client_destroy() voidptr

fn C.mongoc_collection_find_with_opts(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.mongoc_read_prefs_t) &C.mongoc_cursor_t
fn C.mongoc_collection_count_documents() i64
fn C.mongoc_collection_insert_one(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_update_one(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_delete_one(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_destroy() voidptr

fn C.mongoc_cursor_next(&C.mongoc_cursor_t, &C.bson_t) bool
fn C.mongoc_database_destroy() voidptr
fn C.mongoc_cleanup() voidptr

/**		BSON		**/
fn C.bson_new() &C.bson_t
fn C.bcon_new() &C.bson_t
fn C.bcon_utf8() int
fn C.bson_new_from_json() &C.bson_t
fn C.bson_append_document() bool
fn C.bson_append_utf8() bool
fn C.bson_append_int32() bool
fn C.bson_append_oid() bool
fn C.bson_append_null() bool
fn C.bson_append_document_begin() bool
fn C.bson_append_document_end() bool
fn C.bson_destroy() voidptr
