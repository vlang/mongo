import mongo
import time

fn main() {
	url := 'mongodb://127.0.0.1:27017/'

	sw := time.new_stopwatch()

	client := mongo.new_client(url)

	mut dt := sw.elapsed().microseconds()
	println('Elapsed time (new_client): $dt uS') // Elapsed time (new_client): 87 uS

	collection := client.get_collection('vlang', 'mongo-test')

	for i in 0 .. 100 {
		collection.insert_one({
		'str': 'string',
		'number': int(2),
		'float': f64(2.1),
		'boolean': true
		})
	}

	dt = sw.elapsed().microseconds()
	println('Elapsed time (collection): ${f64(dt) * 0.001} ms') // Elapsed time (collection): 110 uS

	response := collection.find({
		'str': 'string'
	}).lean()
	dt = sw.elapsed().microseconds()
	println('Elapsed time (collection): ${f64(dt) * 0.001} ms') // Elapsed time (find): 1159728 uS

	client.get_database('vlang').drop()
}
