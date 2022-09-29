import mongo
import time

struct App {
pub:
	code    string
	version string
}

fn main() {
	url := 'mongodb://127.0.0.1:27017/'

	client := mongo.new_client(url)

	collection := client.get_collection('vlang', 'mongo-test')

	app := App{
		code: 'V'
		version: '0.2.2'
	}

	user_bson := mongo.new_bson_from<App>(app)

	collection.insert_one<&bson_t>(user_bson)

	collection.destroy()
}
