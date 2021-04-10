module mongo

fn init() {
	C.mongoc_init()
}