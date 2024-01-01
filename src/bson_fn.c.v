module mongo

#flag -I @VMODROOT/thirdparty/libbson-1.0
#flag -I @VMODROOT/thirdparty/libmongoc-1.0

#include "mongoc/mongoc.h"
#include "bson/bson.h"

fn C.bson_new() &C.bson_t
fn C.bson_new_from_json(byteptr, int, &C.bson_error_t) &C.bson_t
fn C.bson_init_from_json(&C.bson_t, byteptr, int, &C.bson_error_t) bool
fn C.bson_reinit(&C.bson_t)
fn C.bson_as_json(&C.bson_t, int) byteptr
fn C.bson_as_relaxed_extended_json(&C.bson_t, int) byteptr
fn C.bson_compare(&C.bson_t, &C.bson_t) int
fn C.bson_concat(&C.bson_t, &C.bson_t) bool
fn C.bson_copy(&C.bson_t) &C.bson_t
fn C.bson_copy_to(&C.bson_t, &C.bson_t)
fn C.bson_copy_to_excluding(&C.bson_t, &C.bson_t, byteptr)
fn C.bson_count_keys(&C.bson_t) u32
fn C.bson_equal(&C.bson_t, &C.bson_t) bool
fn C.bson_get_data(&C.bson_t) u8
fn C.bson_has_field(&C.bson_t, byteptr) bool
fn C.bson_free(voidptr)
fn C.bson_as_canonical_extended_json(&C.bson_t, int) byteptr
fn C.bson_destroy(&C.bson_t)

// appends
// http://mongoc.org/libbson/current/bson_append_array.html
fn C.bson_append_array(&C.bson_t, byteptr, int, &C.bson_t) bool

// http://mongoc.org/libbson/current/bson_append_array_begin.html
fn C.bson_append_array_begin(&C.bson_t, byteptr, int, &C.bson_t) bool

// http://mongoc.org/libbson/current/bson_append_array_end.html
fn C.bson_append_array_end(&C.bson_t, &C.bson_t) bool

// http://mongoc.org/libbson/current/bson_append_binary.html
fn C.bson_append_binary(&C.bson_t, byteptr, int, &C.bson_subtype_t, &u8, u32) bool

// http://mongoc.org/libbson/current/bson_append_bool.html
fn C.bson_append_bool(&C.bson_t, byteptr, int, bool) bool

// http://mongoc.org/libbson/current/bson_append_code.html
fn C.bson_append_code(&C.bson_t, byteptr, int, byteptr) bool

// http://mongoc.org/libbson/current/bson_append_code_with_scope.html
fn C.bson_append_code_with_scope(&C.bson_t, byteptr, int, byteptr, &C.bson_t) bool

// http://mongoc.org/libbson/current/bson_append_date_time.html
fn C.bson_append_date_time(&C.bson_t, byteptr, int, i64) bool

// http://mongoc.org/libbson/current/bson_append_decimal128.html
fn C.bson_append_decimal128(&C.bson_t, byteptr, int, &C.bson_decimal128_t) bool

// http://mongoc.org/libbson/current/bson_append_document.html
fn C.bson_append_document(&C.bson_t, byteptr, int, &C.bson_t) bool

// http://mongoc.org/libbson/current/bson_append_document_begin.html
fn C.bson_append_document_begin(&C.bson_t, byteptr, int, &C.bson_t) bool

// http://mongoc.org/libbson/current/bson_append_document_end.html
fn C.bson_append_document_end(&C.bson_t, &C.bson_t) bool

// http://mongoc.org/libbson/current/bson_append_double.html
fn C.bson_append_double(&C.bson_t, byteptr, int, f64) bool

// http://mongoc.org/libbson/current/bson_append_int32.html
fn C.bson_append_int32(&C.bson_t, byteptr, int, int) bool

// http://mongoc.org/libbson/current/bson_append_int64.html
fn C.bson_append_int64(&C.bson_t, byteptr, int, i64) bool

// http://mongoc.org/libbson/current/bson_append_maxkey.html
fn C.bson_append_maxkey(&C.bson_t, byteptr, int) bool

// http://mongoc.org/libbson/current/bson_append_minkey.html
fn C.bson_append_minkey(&C.bson_t, byteptr, int) bool

// http://mongoc.org/libbson/current/bson_append_now_utc.html
fn C.bson_append_now_utc(&C.bson_t, byteptr, int) bool

// http://mongoc.org/libbson/current/bson_append_null.html
fn C.bson_append_null(&C.bson_t, byteptr, int) bool

// http://mongoc.org/libbson/current/bson_append_oid.html
fn C.bson_append_oid(&C.bson_t, byteptr, int, &C.bson_oid_t) bool

// http://mongoc.org/libbson/current/bson_append_regex.html
fn C.bson_append_regex(&C.bson_t, byteptr, int, byteptr, byteptr) bool

// http://mongoc.org/libbson/current/bson_append_regex_w_len.html
fn C.bson_append_regex_w_len(&C.bson_t, byteptr, int, byteptr, int, byteptr) bool

// http://mongoc.org/libbson/current/bson_append_symbol.html
fn C.bson_append_symbol(&C.bson_t, byteptr, int, byteptr, int) bool

// http://mongoc.org/libbson/current/bson_append_time_t.html
fn C.bson_append_time_t(&C.bson_t, byteptr, int, u32) bool

// http://mongoc.org/libbson/current/bson_append_timestamp.html
fn C.bson_append_timestamp(&C.bson_t, byteptr, int, u32, u32) bool

// http://mongoc.org/libbson/current/bson_append_undefined.html
fn C.bson_append_undefined(&C.bson_t, byteptr, int) bool

// http://mongoc.org/libbson/current/bson_append_utf8.html
fn C.bson_append_utf8(&C.bson_t, byteptr, int, byteptr, int) bool

// http://mongoc.org/libbson/current/bson_append_value.html
fn C.bson_append_value(&C.bson_t, byteptr, int, &C.bson_value_t) bool

// bson_oid_t http://mongoc.org/libbson/current/bson_oid_t.html
fn C.bson_oid_compare(&C.bson_oid_t, &C.bson_oid_t) int
fn C.bson_oid_copy(&C.bson_oid_t, &C.bson_oid_t)
fn C.bson_oid_equal(&C.bson_oid_t, &C.bson_oid_t) bool
fn C.bson_oid_get_time_t(&C.bson_oid_t) int
fn C.bson_oid_hash(&C.bson_oid_t) u32
fn C.bson_oid_init_from_data(&C.bson_oid_t, u8)
fn C.bson_oid_init_from_string(&C.bson_oid_t, byteptr)
fn C.bson_iter_find_descendant(&&C.bson_iter_t, &&char, &&bson_iter_t)

// DEPRECATED: bson_oid_init_sequence
fn C.bson_oid_is_valid(charptr, int) bool
fn C.bson_oid_to_string(&C.bson_oid_t, charptr)

fn C.bson_oid_init(&C.bson_oid_t, &C.bson_context_t)

// TODO: not implemented
// fn bson_append_timeval
// fn bson_validate_with_error
// fn bson_steal
// fn bson_sized_new
// fn bson_new_from_data
// fn bson_new_from_buffer
// fn bson_init_static
// fn bson_destroy_with_steal
// fn bson_copy_to_excluding_noinit
// fn bson_copy_to_excluding_noinit_va
// fn bson_reinit
// fn bson_reserve_buffer
// fn bson_append_dbpointer
// fn bson_array_as_json
// fn bson_append_iter
