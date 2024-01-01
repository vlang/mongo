module mongo

// http://mongoc.org/libmongoc/1.17.0/mongoc_query_flags_t.html
pub enum QueryFlags {
	@none             = 0 // Specify no query flags.
	tailable_cursor   = 1 // Cursor will not be closed when the last data is retrieved. You can resume this cursor later.
	slave_ok          = 2 // Allow query of replica set secondaries.
	oplog_replay      = 3 // Used internally by MongoDB.
	no_cursor_timeout = 4 // The server normally times out an idle cursor after an inactivity period (10 minutes). This prevents that.
	await_data        = 5 // Use with MONGOC_QUERY_TAILABLE_CURSOR. Block rather than returning no data. After a period, time out.
	exhaust           = 6 // Stream the data down full blast in multiple “reply” packets. Faster when you are pulling down a lot of data and you know you want to retrieve it all. Only applies to cursors created from a find operation (i.e. mongoc_collection_find()).
	partial           = 7 // Get partial results from mongos if some shards are down (instead of throwing an error).
}
