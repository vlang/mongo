## Mongo

_MongoDB driver for vlang_

### Getting start:

#### Installing dependeces

[libmongoc](http://mongoc.org/libmongoc/current/installing.html#install-libmongoc-with-a-package-manager)(MongoDB C Driver)
[libbson](http://mongoc.org/libmongoc/current/installing.html#install-libbson-with-a-package-manager)(BSON library)

```bash
# Debian and Ubuntu
sudo apt-get install libmongoc-dev
sudo apt-get install libbson-1.0-0
```

```bash
# Fedora
dnf install mongo-c-driver
dnf install libbson
```

```bash
# CentOS and RHEL 7
yum install mongo-c-driver
yum install libbson
```

```bash
# macOS
brew install mongo-c-driver
```

#### Starting MongoDB

```bash
mongo --host localhost --port 27017
```

#### Installing mongo package from `vpm`

```bash
v install mongo
```

### Roadmap:

- [x] `add basic fn to wrap mongo and bson`
- [ ] `add sugar fn to get fields of bson`
- [ ] `define required tasks to get a complete use of mongo with V`
- [ ] `add more sugar fn` (Ex: collection.insert<T>(t T) inserts a V Struct in a collection)
- [ ] `add bulk query support` (Ex: insert_many)
- [ ] `separate bson into a submodule of mongo`
      Future:
- [ ] `Build a native bson vlang library`
- [ ] `Build a native mongo vlang library`

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
  collection := client.get_collection('db_name', 'collection_name')
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

- initialize BSON from JSON

  ```v
  bson_doc := mongo.new_from_json('{"heeey": "howudoinggggg =)"}')
  ```

- update value by selector and update

  ```v
  selector := mongo.new_from_json('{"key":"value1"}')
  update := mongo.new_from_json('{"\$set":{"value":"key1"}}')

  collection.update_one(collection, selector, update)
  ```
