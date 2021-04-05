module main

import mongo
import bson
import json

struct User {
pub:
	first_name string
	last_name  string
}

fn main() {
	uri := 'mongodb://127.0.0.1:27017'
	mongo_uri := mongo.uri_new(uri)
	client := mongo.client_new_from_uri(mongo_uri)
	collection := mongo.client_get_collection(client, 'db_name', 'users')

	// creating User to encode it in JSON
	user := User{
		first_name: 'Alexandr'
		last_name: 'Pashkevich'
	}

	user_bson := bson.new_from_json(json.encode(user))

	mongo.collection_insert_one(collection, user_bson)
}
