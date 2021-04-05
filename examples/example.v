module main

import mongo
import mongo.bson
import json

struct App {
pub:
	code string
	version  string
}

fn main() {
	uri := 'mongodb://127.0.0.1:27017'
	mongo_uri := mongo.uri_new(uri)
	client := mongo.client_new_from_uri(mongo_uri)
	collection := mongo.client_get_collection(client, 'db_name', 'users')

	app := App{
		code: 'V'
		version: '0.2.2'
	}

	user_bson := bson.new_from_json(json.encode(app))

	mongo.collection_insert_one(collection, user_bson)
}
