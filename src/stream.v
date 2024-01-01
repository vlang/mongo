module mongo

import os

@[inline]
pub fn new_stream_file(file os.File) &C.mongoc_stream_file_t {
	return C.mongoc_stream_file_new(file.fd)
}

// [inline]
// pub fn (stream &C.mongoc_stream_t) timed_out() bool {
// 	return C.mongoc_stream_timed_out(stream)
// }

// [inline]
// pub fn (stream &C.mongoc_stream_t) should_retry() bool {
// 	return C.mongoc_stream_should_retry(stream)
// }

// [inline]
// pub fn (stream &C.mongoc_stream_t) close() int {
// 	return C.mongoc_stream_close(stream)
// }

// [inline]
// pub fn (stream &C.mongoc_stream_t) flush() int {
// 	return C.mongoc_stream_flush(stream)
// }

// [inline]
// pub fn (stream &C.mongoc_stream_t) destroy() {
// 	C.mongoc_stream_destroy(stream)
// }
