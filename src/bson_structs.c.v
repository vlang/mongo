module mongo

#flag -I @VMODROOT/thirdparty/libbson-1.0
#flag -I @VMODROOT/thirdparty/libmongoc-1.0
#flag -l mongoc-1.0
#flag -l bson-1.0

#include "mongoc/mongoc.h"
#include "bson/bson.h"

// http://mongoc.org/libbson/current/bson_t.html
@[typedef]
pub struct C.bson_t {
	flags   u32 // Internal flags for the bson_t.
	len     u32 // Length of BSON data.
	padding u8 // Padding for stack allocation.
}

// http://mongoc.org/libbson/current/bson_oid_t.html
@[typedef]
pub struct C.bson_oid_t {
	bytes u8 // ObjectId is a 12-byte BSON type
}

// http://mongoc.org/libbson/current/bson_subtype_t.html
@[typedef]
pub struct C.bson_subtype_t {}

// http://mongoc.org/libbson/current/bson_context_t.html
@[typedef]
pub struct C.bson_context_t {}

// http://mongoc.org/libbson/current/bson_type_t.html
@[typedef]
pub struct C.bson_type_t {}

// http://mongoc.org/libbson/current/bson_decimal128_t.html
@[typedef]
pub struct C.bson_decimal128_t {}

// http://mongoc.org/libbson/current/bson_iter_t.html
@[typedef]
pub struct C.bson_iter_t {}

// http://mongoc.org/libbson/current/bson_value_t.html
@[typedef]
pub struct C.bson_value_t {}

// http://mongoc.org/libbson/current/bson_error_t.html
@[typedef]
pub struct C.bson_error_t {
	domain  u32
	code    u32
	message charptr
}
