import mongo

fn main() {
	url := 'mongodb://127.0.0.1:27017'

	client := mongo.new_client(url)
	collection := client.get_collection('teste', 'agreements')

	bson_filter := mongo.new_bson_from<map[string]string>({
		'version': '0.2.2'
	})

	response := collection.find(bson_filter).lean()

	println(response)
}