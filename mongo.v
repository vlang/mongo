module mongo

fn init() {
	C.mongoc_init()
}

pub fn collection_keys_to_index_string(bson &C.bson_t) string {
	return unsafe {
		C.mongoc_collection_keys_to_index_string(bson).vstring()
	}
}