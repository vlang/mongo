module mongo

import x.json2

struct Test {
	str     string
	number  int
	float   f64
	boolean bool
}

fn test_bson_t_insert() {
	url := 'mongodb://127.0.0.1:27017/'

	client := new_client(url)

	collection := client.get_collection('vlang', 'mongo-test')

	test := Test{
		str: 'string'
		number: int(2)
		float: f64(2.1)
		boolean: true
	}

	struct_bson := new_bson_from<Test>(test)
	is_struct_bson_inserted := collection.insert_one(struct_bson)
	struct_bson.destroy()

	map_bson := new_bson_from<map[string]string>({
		'str':            'string'
		'number_string':  '2'
		'float_string':   '2.1'
		'boolean_string': 'true'
	})
	is_map_bson_inserted := collection.insert_one(map_bson)
	map_bson.destroy()

	// TODO
	// any_map_bson := new_bson_from<map[string]json2.Any>({'str': 'string','number': 2, 'float': 2.1,'boolean': true})
	// is_any_map_bson_inserted := collection.insert_one(map_bson)
	// any_map_bson.destroy()

	json_bson := new_from_json('{"str":"string","number":2,"float":2.1,"boolean":true}')
	is_json_bson_inserted := collection.insert_one(json_bson)

	// // TODO - when https://github.com/vlang/v/issues/15923 be fixed
	// encoded_json2_any_types := json2.encode({"str":"string","number":2,"float":2.1,"boolean":true})
	// encoded_json2_any_types_bson := new_from_json(encoded_json1)
	// is_encoded_json2_any_types_bson_inserted := collection.insert_one(json_bson)

	// // TODO - when https://github.com/vlang/v/issues/15923 be fixed
	// encoded_json2_any_sub_types := json2.encode({"str":"string","number":{"data":2},"float":{"value":2.1},"boolean":{"status":true}})
	// encoded_json2_any_sub_types_bson := new_from_json(encoded_json1)
	// is_encoded_json2_any_sub_types_bson_inserted := collection.insert_one(json_bson)

	collection.destroy()

	assert is_struct_bson_inserted
	assert is_map_bson_inserted
	assert is_json_bson_inserted
	// assert is_any_map_bson
	// assert is_encoded_json2_any_types_bson_inserted
	// assert is_encoded_json2_any_sub_types_bson_inserted
	client.get_database('vlang').drop()
	client.destroy()
}


fn test_bson_t_find_lean() {
	url := 'mongodb://127.0.0.1:27017/'

	client := new_client(url)

	collection := client.get_collection('vlang', 'mongo-test')

	test := Test{
		str: 'string'
		number: int(2)
		float: f64(2.1)
		boolean: true
	}

	struct_bson := new_bson_from<Test>(test)
	for i in 0 .. 3 {
		print(i)
		collection.insert_one(struct_bson)
	}
	struct_bson.destroy()

	response := collection.find({
		'str': 'string'
	}).lean()

	// // TODO - when https://github.com/vlang/v/issues/15923 be fixed
	// assert response == [{"_id":{"\$oid":"633587f719a6f14926055715"},"str":"string","number":2,"float":2.1,"boolean":true},{"_id":{"$oid":"633587f719a6f14926055716"},"str":"string","number":2,"float":2.1,"boolean":true},{"_id":{"\$oid":"633587f719a6f14926055717"},"str":"string","number":2,"float":2.1,"boolean":true}]

	// // TODO - when x.json2.Any.str() can convert symbols like $
	// assert response.str() == '[{"_id":{"\$oid":"633587f719a6f14926055715"},"str":"string","number":2,"float":2.1,"boolean":true},{"_id":{"$oid":"633587f719a6f14926055716"},"str":"string","number":2,"float":2.1,"boolean":true},{"_id":{"\$oid":"633587f719a6f14926055717"},"str":"string","number":2,"float":2.1,"boolean":true}]'

	for obj in response{
		assert obj.as_map()["str"] or {0}.str() == "string"
		assert obj.as_map()["number"] or {0}.int() == 2
		assert obj.as_map()["float"] or {0}.f64() == 2.1
		assert obj.as_map()["boolean"] or {0}.bool() == true
	}

	client.get_database('vlang').drop()
	client.destroy()
}
