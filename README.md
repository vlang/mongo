**VMongo**
mongo drive for vlang

**Dependencies**

- libmongoc
- libbson


**Examples**

- connect to mongo
    ```v

    mongo_uri := mongo.uri_new('mongodb://127.0.0.1:27017')
    client := mongo_uri.new_client()
    ```
- select database
  ```v
  database := client.get_database('db_name')
  ```

- select collection
  ```v
  collection := client.get_collection('db_name', 'collection_name')
  ```

- create new BSON document
  ```v
  bson_document := mongo.new_from_json('{}')
  ```

- append bool field to BSON document
  ```v
  bson_document.append_bool('key' false)
  ```
  you can add field of any type you want, checkout [here](bson/funcs_append.v)

- insert one document
    ```v
    mongo_uri := mongo.uri_new('mongodb://127.0.0.1:27017')
    client := mongo_uri.new_client()
    collection := client.get_collection('db_name', collection_name')
    bson_document := mongo.new_bson()
    bson_document.append_bool('key' false)
    collection.insert_one(bson_document)
    ```

- find documents by query
    ```v
    query := mongo.new_bson()
    query.append_bool('bool', true)

    bson_doc := mongo.new_bson()

    cursor := collection.find_with_opts(query)

    for cursor.next(&bson_doc) {
        str := mongo.as_canonical_extended_json(bson_doc)
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
