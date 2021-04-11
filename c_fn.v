module mongo

#flag -I/usr/local/include/libbson-1.0
#flag -I/usr/local/include/libmongoc-1.0
#flag -lmongoc-1.0
#flag -lbson-1.0

#include "mongoc/mongoc.h"
#include "bson/bson.h"

fn C.mongoc_init()

fn C.mongoc_uri_new(byteptr) &C.mongoc_uri_t
fn C.mongoc_uri_destroy(&C.mongoc_uri_t)

fn C.mongoc_client_new(byteptr) &C.mongoc_client_t
fn C.mongoc_client_new_from_uri(&C.mongoc_uri_t) &C.mongoc_client_t
fn C.mongoc_client_destroy(&C.mongoc_client_t)

fn C.mongoc_client_pool_new(&C.mongoc_uri_t) &C.mongoc_client_pool_t
fn C.mongoc_client_pool_pop(&C.mongoc_client_pool_t) &C.mongoc_client_t
fn C.mongoc_client_pool_push(&C.mongoc_client_pool_t, &C.mongoc_client_t)
fn C.mongoc_client_pool_destroy(&C.mongoc_client_pool_t)

fn C.mongoc_client_set_appname()

fn C.mongoc_client_get_database(&C.mongoc_client_t, byteptr) &C.mongoc_database_t
fn C.mongoc_client_get_collection(&C.mongoc_client_t, byteptr, byteptr) &C.mongoc_collection_t

fn C.mongoc_collection_find(&C.mongoc_collection_t, &QueryFlags, u32, u32, u32, &C.bson_t, &C.bson_t, &C.mongoc_read_prefs_t) &C.mongoc_cursor_t
fn C.mongoc_collection_find_with_opts(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.mongoc_read_prefs_t) &C.mongoc_cursor_t
// TODO implement
fn C.mongoc_collection_find_and_modify(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_t, bool, bool, bool, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_replace_one(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_count_documents(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.mongoc_read_prefs_t, &C.bson_t, &C.bson_error_t) i64
fn C.mongoc_collection_insert_one(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_insert_many(&C.mongoc_collection_t, voidptr, int, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_update_one(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_delete_one(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_destroy(&C.mongoc_collection_t)

fn C.mongoc_database_destroy(&C.mongoc_database_t)

fn C.mongoc_cursor_next(&C.mongoc_cursor_t, &&C.bson_t) bool
fn C.mongoc_cursor_clone(&C.mongoc_cursor_t) &C.mongoc_cursor_t
fn C.mongoc_cursor_error(&C.mongoc_cursor_t, &C.bson_t) bool
fn C.mongoc_cursor_destroy(&C.mongoc_cursor_t)
//fn C.mongoc_cursor_get_host(&C.mongoc_cursor_t)

fn C.mongoc_cleanup()