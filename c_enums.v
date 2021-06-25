module mongo

// http://mongoc.org/libmongoc/1.17.0/mongoc_query_flags_t.html
pub enum QueryFlags {
   @none = 0
   tailable_cursor = 1
   slave_ok = 2
   oplog_replay = 3
   no_cursor_timeout = 4
   await_data = 5
   exhaust = 6
   partial = 7
}