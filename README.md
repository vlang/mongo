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

**Examples**


```v
// connect to mongo
mongo_uri := mongo.uri_new('mongodb://127.0.0.1:27017')
client := mongo_uri.new_client()

// select database
database := client.get_database('db_name')

// select collection
collection := client.get_collection('db_name', 'collection_name')

// insert collection
collection.insert_one({
  'str':     'string'
  'number':  2
  'float':   2.1
  'boolean': true
})

// find collection
response := collection.find({
  'str': 'string'
}).lean()

assert response[0].as_map()['str'] or { 0 }.str() == 'string'

```
