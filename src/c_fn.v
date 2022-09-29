module mongo

#flag -I @VMODROOT/thirdparty/libbson-1.0
#flag -I @VMODROOT/thirdparty/libmongoc-1.0
#flag -l mongoc-1.0
#flag -l bson-1.0

#include "mongoc/mongoc.h"
#include "bson/bson.h"

fn C.mongoc_init()

fn C.mongoc_uri_new(byteptr) &C.mongoc_uri_t
fn C.mongoc_uri_destroy(&C.mongoc_uri_t)

fn C.mongoc_client_new(byteptr) &C.mongoc_client_t
fn C.mongoc_client_new_from_uri(&C.mongoc_uri_t) &C.mongoc_client_t
fn C.mongoc_client_destroy(&C.mongoc_client_t)
fn C.mongoc_client_set_appname(&C.mongoc_client_t, byteptr) bool

fn C.mongoc_client_pool_new(&C.mongoc_uri_t) &C.mongoc_client_pool_t
fn C.mongoc_client_pool_pop(&C.mongoc_client_pool_t) &C.mongoc_client_t
fn C.mongoc_client_pool_push(&C.mongoc_client_pool_t, &C.mongoc_client_t)
fn C.mongoc_client_pool_destroy(&C.mongoc_client_pool_t)

fn C.mongoc_client_get_database(&C.mongoc_client_t, byteptr) &C.mongoc_database_t
fn C.mongoc_client_get_collection(&C.mongoc_client_t, byteptr, byteptr) &C.mongoc_collection_t

fn C.mongoc_collection_find(&C.mongoc_collection_t, &QueryFlags, u32, u32, u32, &C.bson_t, &C.bson_t, &C.mongoc_read_prefs_t) &C.mongoc_cursor_t
fn C.mongoc_collection_find_with_opts(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.mongoc_read_prefs_t) &C.mongoc_cursor_t

fn C.mongoc_collection_keys_to_index_string(&C.bson_t) byteptr

// TODO implement
fn C.mongoc_collection_find_and_modify(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_t, bool, bool, bool, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_replace_one(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_count_documents(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.mongoc_read_prefs_t, &C.bson_t, &C.bson_error_t) i64
fn C.mongoc_collection_insert_one(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_insert_many(&C.mongoc_collection_t, voidptr, int, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_update_one(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_delete_one(&C.mongoc_collection_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_collection_create_bulk_operation_with_opts(&C.mongoc_collection_t, &C.bson_t) &C.mongoc_bulk_operation_t
fn C.mongoc_collection_destroy(&C.mongoc_collection_t)

fn C.mongoc_database_create_collection(&C.mongoc_database_t, byteptr, &C.bson_t, &C.bson_error_t) &C.mongoc_collection_t
fn C.mongoc_database_add_user(&C.mongoc_database_t, byteptr, byteptr, &C.bson_t, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_database_find_collections_with_opts(&C.mongoc_database_t, &C.bson_t) &C.mongoc_cursor_t
fn C.mongoc_database_write_command_with_opts(&C.mongoc_database_t, &C.bson_t, &C.bson_t, &C.bson_t, &C.bson_error_t) bool
fn C.mongoc_database_drop(&C.mongoc_database_t, &C.bson_error_t) bool
fn C.mongoc_database_destroy(&C.mongoc_database_t)

fn C.mongoc_cursor_next(&C.mongoc_cursor_t, &&C.bson_t) bool
fn C.mongoc_cursor_set_limit(&C.mongoc_cursor_t, int) bool
fn C.mongoc_cursor_clone(&C.mongoc_cursor_t) &C.mongoc_cursor_t
fn C.mongoc_cursor_error(&C.mongoc_cursor_t, &C.bson_error_t) bool
fn C.mongoc_cursor_destroy(&C.mongoc_cursor_t)

// fn C.mongoc_cursor_get_host(&C.mongoc_cursor_t)

fn C.mongoc_stream_timed_out(&C.mongoc_stream_t) bool
fn C.mongoc_stream_should_retry(&C.mongoc_stream_t) bool
fn C.mongoc_stream_close(&C.mongoc_stream_t) int
fn C.mongoc_stream_flush(&C.mongoc_stream_t) int
fn C.mongoc_stream_destroy(&C.mongoc_stream_t)

fn C.mongoc_stream_file_new(int) &C.mongoc_stream_file_t

fn C.mongoc_cleanup()
