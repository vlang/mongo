import bson

fn test_as_json() {
	doc := bson.new_from_json('{"insert":"test"}')
	assert bson.as_json(doc).replace(' ', '') == '{"insert":"test"}'
}

fn test_compare1() {
	doc1 := bson.new_from_json('{"insert":"test"}')
	doc2 := bson.new_from_json('{"insert":"test"}')
	assert bson.compare(doc1, doc2) == 0
}

fn test_compare2() {
	doc1 := bson.new_from_json('{"insert":"test"}')
	doc2 := bson.new_from_json('{"insert":"test1"}')
	assert bson.compare(doc1, doc2) != 0
}

fn test_concat() {
	doc1 := bson.new_from_json('{"key":"value"}')
	doc2 := bson.new_from_json('{"key1":"value1"}')
	bson.concat(doc1, doc2)
	assert bson.as_json(doc1).replace(' ', '') == '{"key":"value","key1":"value1"}'
}

fn test_count_keys() {
	doc1 := bson.new_from_json('{"key":"value","key1":"value1","key3":"value3"}')
	assert bson.count_keys(doc1) == 3
}

fn test_equal1() {
	doc1 := bson.new_from_json('{"insert":"test"}')
	doc2 := bson.new_from_json('{"insert":"test"}')
	assert bson.equal(doc1, doc2)
}

fn test_equal2() {
	doc1 := bson.new_from_json('{"insert":"test"}')
	doc2 := bson.new_from_json('{"insert":"test1"}')
	assert !bson.equal(doc1, doc2)
}

fn test_has_field1() {
	doc1 := bson.new_from_json('{"insert":"test"}')
	assert !bson.has_field(doc1, 'doc2')
}

fn test_has_field2() {
	doc1 := bson.new_from_json('{"insert":"test"}')
	assert bson.has_field(doc1, 'insert')
}
