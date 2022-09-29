import mongo
import time

fn main() {
	url := 'mongodb://127.0.0.1:27017/'

	sw := time.new_stopwatch()

	client := mongo.new_client(url)
	mut dt := sw.elapsed().microseconds()
	println('Elapsed time (new_client): $dt uS') // Elapsed time (new_client): 87 uS

	collection := client.get_collection('teste', 'agreements')
	dt = sw.elapsed().microseconds()
	println('Elapsed time (collection): $dt uS') // Elapsed time (collection): 110 uS

	response := collection.find({
		'version': '0.2.2'
		'b':       0
	}).lean()
	dt = sw.elapsed().microseconds()
	println('Elapsed time (find): $dt uS') // Elapsed time (find): 1159728 uS

	println(response)
}
