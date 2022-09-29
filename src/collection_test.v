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
	json_bson := new_from_json('{"str":"string","number":2,"float":2.1,"boolean":true}')

	child := json2.Any({
		'bar': json2.Any(10)
	})

	collection.insert_one({
		'str':     'string'
		'number':  2
		'float':   2.1
		'boolean': true
		'foo':     child
	})
	assert collection.insert_one_from<Test>(test)
	assert collection.insert_one_from_bson_t(struct_bson)
	assert collection.insert_one_from_bson_t(json_bson)

	struct_bson.destroy()
	json_bson.destroy()
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

	for i in 0 .. 3 {
		print(i)
		collection.insert_one_from<Test>(test)
	}

	response := collection.find({
		'str': 'string'
	}).lean()

	// // TODO - when https://github.com/vlang/v/issues/15923 be fixed
	// assert response == [{"_id":{"\$oid":"633587f719a6f14926055715"},"str":"string","number":2,"float":2.1,"boolean":true},{"_id":{"$oid":"633587f719a6f14926055716"},"str":"string","number":2,"float":2.1,"boolean":true},{"_id":{"\$oid":"633587f719a6f14926055717"},"str":"string","number":2,"float":2.1,"boolean":true}]

	// // TODO - when x.json2.Any.str() can convert symbols like $
	// assert response.str() == '[{"_id":{"\$oid":"633587f719a6f14926055715"},"str":"string","number":2,"float":2.1,"boolean":true},{"_id":{"$oid":"633587f719a6f14926055716"},"str":"string","number":2,"float":2.1,"boolean":true},{"_id":{"\$oid":"633587f719a6f14926055717"},"str":"string","number":2,"float":2.1,"boolean":true}]'

	for obj in response {
		assert obj.as_map()['str'] or { 0 }.str() == 'string'
		assert obj.as_map()['number'] or { 0 }.int() == 2
		assert obj.as_map()['float'] or { 0 }.f64() == 2.1
		assert obj.as_map()['boolean'] or { 0 }.bool() == true
	}

	client.get_database('vlang').drop()
	client.destroy()
}
