import mongo
import json

struct App {
pub:
	code string
	version  string
}

fn main() {
	mongo_uri := mongo.uri_new('mongodb://127.0.0.1:27017')
	client := mongo_uri.new_client()
	collection := client.get_collection('db_name', 'users')

	app := App{
		code: 'V'
		version: '0.2.2'
	}

	user_bson := bson.new_from_json(json.encode(app))

	mongo.collection_insert_one(collection, user_bson)
}
