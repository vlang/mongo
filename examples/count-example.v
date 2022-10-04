import mongo

fn main() {
	url := 'mongodb://127.0.0.1:27017/'

	client := mongo.new_client(url)

	collection := client.get_collection('test', 'mongo-test')

	collection.insert_one({
		'version': '0.2.2'
	})

	count := collection.count({
		'version': '0.2.2'
	})

	println(count)
	client.get_database('test').drop()
}
