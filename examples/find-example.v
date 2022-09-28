import mongo

struct App {
pub:
	version string
}

fn main() {
	url := 'mongodb://127.0.0.1:27017'

	client := mongo.new_client(url)

	collection := client.get_collection('teste', 'agreements')

	app := App{
		version: '0.2.2'
	}

	user_bson := mongo.new_bson_from<App>(app)

	cursor := collection.find(user_bson)

	document := mongo.new_bson()

	for cursor.next_doc(&document) {
		// declare str to avoid v errors
		str := document.str()
		println(str)
	}

	if !cursor.next_doc(&document) {
		println(false)
	}
}
