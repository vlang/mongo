import mongo
import time

fn main() {
	url := 'mongodb://127.0.0.1:27017/'

	sw := time.new_stopwatch()

	client := mongo.new_client(url)

	mut dt := sw.elapsed().microseconds()
	println('Elapsed time (new_client): ${dt} uS') // Elapsed time (new_client): 38 uS

	collection := client.get_collection('test', 'mongo-test')

	collection.insert_one({
		'str':     'string'
		'number':  int(2)
		'float':   f64(2.1)
		'boolean': true
	})

	dt = sw.elapsed().microseconds()
	println('Elapsed time (insert_one): ${f64(dt) * 0.001} ms') // Elapsed time (insert_one): 16.808 ms

	response := collection.find({
		'str': 'different'
	}).lean()

	dt = sw.elapsed().microseconds()
	println('Elapsed time (find): ${f64(dt) * 0.001} ms') // Elapsed time (find): 17.173000000000002 ms

	println(response)
	client.get_database('test').drop()
}
