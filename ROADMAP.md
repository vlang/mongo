### Roadmap:

#### v0.0.1
- [x] `define required tasks to get a complete use of mongo with V`
- [x] `add basic fn to wrap mongo and bson`
#### v1.0.0

- insert_one
- [x] `collection.insert_one(document map[string]json2.Any) bool`
- [x] `collection.insert_one_from<T>(t T) bool`
- [x] `collection.insert_one_from_bson_t(document &C.bson_t) bool`
- find
- [x] `collection.find(document map[string]json2.Any) &C.mongoc_cursor_t`
- [x] `collection.find_from<T>(t T) &C.mongoc_cursor_t`
- [x] `collection.find_from_bson_t(document &C.bson_t) &C.mongoc_cursor_t`
- count
- [x] `collection.count(document map[string]json2.Any) i64`
- [x] `collection.count_from<T>(t T) i64`
- [x] `collection.count_from_bson_t(document &C.bson_t) i64`
- update_one
- [ ] `collection.update_one(document map[string]json2.Any) bool`
- [ ] `collection.update_one_from<T>(t T) bool`
- [ ] `collection.update_one_from_bson_t(document &C.bson_t) bool`
- delete_one
- [ ] `collection.delete_one(document map[string]json2.Any) bool`
- [ ] `collection.delete_one_from<T>(t T) bool`
- [ ] `collection.delete_one_from_bson_t(document &C.bson_t) bool`
- insert_may
- [ ] `add bulk query support` (Ex: insert_many)
- others
- [ ] `separate bson into a submodule of mongo`

#### v1.0.1
- aggregate
- [ ] `mongoc_collection_aggregate`
- [ ] `mongoc_database_aggregate`

#### v2.0.0

- [ ] `Build a native bson vlang library`
- [ ] `Build a native mongo vlang library`
