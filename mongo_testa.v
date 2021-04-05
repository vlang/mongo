module mongo

/*
import mongo.bson

const (
	uri             = 'mongodb://127.0.0.1:27017'
	mongo_uri       = uri_new(uri)
	client          = client_new_from_uri(mongo_uri)
	db_name         = 'db_name'
	collection_name = 'collection_name'
	collection      = client_get_collection(client, db_name, collection_name)
)

fn test_insert() {
	doc := bson.new_from_json('{"insert":"test"}')
	assert collection_insert_one(collection, doc) == true
}

fn test_update() {
	selector := bson.new_from_json('{"update":"test"}')
	update := bson.new_from_json('{"\$set":{"update2":"test2"}}')

	collection_insert_one(collection, selector)

	assert collection_update_one(collection, selector, update) == true
}

fn test_delete() {
	doc := bson.new_from_json('{"delete":"test"}')

	collection_insert_one(collection, doc)
	assert collection_delete_one(collection, doc) == true
}