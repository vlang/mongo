import mongo

struct App {
pub:
	version string
}

fn main() {
	url := 'mongodb://127.0.0.1:27017'

	client := mongo.new_client(url)

	collection := client.get_collection('teste', 'agreements')

	collection.insert_one({
		'version': '0.2.2'
	})

	cursor := collection.find({
		'version': '0.2.2'
	})

	document := mongo.new_bson()

	for cursor.next_doc(&document) {
		// declare str to avoid v errors
		str := document.str()
		println(str)
	}

	if !cursor.next_doc(&document) {
		println(false)
	}

	client.get_database('teste').drop()
}
