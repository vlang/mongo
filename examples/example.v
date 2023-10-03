module main

import os
import mongo

fn main() {
	url := os.getenv_opt('DATABASE_URL') or { 'mongodb://127.0.0.1:27017' }

	// connect to mongo
	client := mongo.new_client(url)

	// select database
	database := client.get_database('db_name')

	// select collection
	collection := client.get_collection('db_name', 'collection_name')

	// insert collection
	collection.insert_one({
		'str':     'string'
		'number':  2
		'float':   2.1
		'boolean': true
	})

	// find collection
	response := collection.find({
	'str': 'string'
	}).lean()

	assert response[0].as_map()['str'] or { 0 }.str() == 'string'
}