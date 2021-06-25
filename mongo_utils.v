module mongo

pub fn bson_create_index(field_name string, order int) &C.bson_t {
	if order !in [1, -1] {
		error('order not valid, must be 1 or -1')
	}
	bson_index := new_from_json('{"$field_name": $order}')
	index_name := collection_keys_to_index_string(bson_index)
	println(index_name)
	return new_from_json('')
}