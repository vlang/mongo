import mongo
import x.json2

struct Test {
	str     string
	number  int
	float   f64
	boolean bool
}

fn main() {
	url := 'mongodb://127.0.0.1:27017/'

	client := mongo.new_client(url)

	collection := client.get_collection('test', 'mongo-test')

	test := Test{
		str: 'string'
		number: int(2)
		float: f64(2.1)
		boolean: true
	}

	struct_bson := mongo.new_bson_from[Test](test)
	json_bson := mongo.new_from_json('{"str":"string","number":2,"float":2.1,"boolean":true}')

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

	collection.insert_one_from(test)
	collection.insert_one_from_bson_t(struct_bson)
	collection.insert_one_from_bson_t(json_bson)

	struct_bson.destroy()
	json_bson.destroy()
	client.get_database('test').drop()
}
