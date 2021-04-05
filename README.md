**VMongo**
mongo drive for vlang

**Dependencies**

- libmongoc
- libbson

**Modules**

- [bson](docs/bson.md)
- [mongo](docs/mongo.md)


**Examples**

- connect to mongo
    ```v
    uri := 'mongodb://127.0.0.1:27017'
    mongo.initialize()

    mongo_uri := mongo.uri_new(uri)
    client := mongo.client_new_from_uri(mongo_uri)
    ```
- select database
  ```v
  database := mongo.client_get_database(client, 'db_name')
  ```

- select collection
  ```v
  collection := mongo.client_get_collection(client, 'db_name', 'collection_name')
  ```

- create new BSON document
  ```v
  bson_document := bson.new()
  ```

- append bool field to BSON document
  ```v
  bson.append_bool(bson_document, 'key' false)
  ```
  you can add field of any type you want, checkout [here](bson/funcs_append.v)

- insert one document
    ```v
    uri := 'mongodb://127.0.0.1:27017'
    mongo.initialize()

    mongo_uri := mongo.uri_new(uri)
    client := mongo.client_new_from_uri(mongo_uri)
    collection := mongo.client_get_collection(client, 'db_name', 'collection_name')
    bson_document := bson.new()
    bson.append_bool(bson_document, 'key' false)
    mongo.collection_insert_one (collection, bson_document)
    ```

- find documents by query
    ```v
    query := bson.new()
    bson_doc := bson.new()
    bson.append_bool(query, 'bool', true)

    cursor := mongo.collection_find_with_opts(collection, query)

    for mongo.cursor_next(cursor, &bson_doc) {
        str := bson.as_canonical_extended_json(bson_doc)
        println(str)
    }
    ```
- initialize BSON from JSON :heart_eyes:
  ```v
  bson_doc := bson.new()
  json_doc := '{"heeey": "howudoinggggg =)"}'
  bson.init_from_json(bson_doc, json_doc)
  ```
- update value by selector and update :frog:
  ```v
  selector := bson.new()
  update := bson.new()

  bson.init_from_json(selector, '{"key":"value1"}')
  bson.init_from_json(update, '{"\$set":{"value":"key1"}}')


  mongo.collection_update_one(collection, selector, update)
  ```
