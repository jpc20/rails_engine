## Rails Engine API

### Overview
Rails Engine is a 1 week project completed in Module 3 of the back-end program at Turing School of Software and Design.

### Setup

**Git Setup**
```
$ git clone git@github.com:jpc20/rails_engine.git
$ cd rails_engine
$ bundle install
```
**Database**  
```
$ bundle exec rake import_data
```
**Testing**
```
$ bundle exec rspec
```

### Versions
```
  Rails 5.1.7
  Ruby 2.5.3 
```

### Testing
Rspec was used to test all of the endpoints. The front end of the application that has a spec harness which also tests all of the endpoints and is responsible for displaying the data can be found at [Rails Driver](https://github.com/jpc20/rails_driver)
### Schema
![schema]()

### Endpoints  

#### Index of an Item or Merchant

Request:
```
GET /api/v1/merchants
```
Response:
```
body:
{
  "data": [
    {
      "id": "1",
        "type": "merchant",
        "attributes": {
          "name": "Awesome Store",
        }
    },
    {
      "id": "2",
      "type": "merchant",
      "attributes": {
        "name": "Store of Fate",
      }
    }
  ]
}
```
#### Show an Item or Merchant

Request:
```
GET /api/v1/items/1
```
Response:
```
body:
{
  "data": {
      "id": "1",
      "type": "item",
      "attributes": {
        "name": "Item Name",
        "description": "Item Description",
        "unit_price": "31163",
        "merchant_id": "1"
        }
    }
}
```
#### Create an Item or Merchant

Request:
```
POST /api/v1/merchants
body: 
{
  "attribute1": "value1",
  "attribute2": "value2"
}
```
Response:
```
body:
{
  "data": {
    "id": "1",
    "type": "merchant",
    "attributes": {
      "name": "Store Name"
    }
  }
}
```
#### Update an Item or Merchant

Request:
```
PATCH /api/v1/merchants/:id
body: 
{
  "attribute1": "value1",
  "attribute2": "value2"
}
```
Response:
```
body:
{
  "data": {
    "id": "1",
    "type": "merchant",
    "attributes": {
      "name": "Store Name"
    }
  }
}
```
#### Destroy an Item or Merchant

Request:
```
DELETE /api/v1/merchants/:id
```
Response:
```
body:
{
  "data": {
    "id": "1",
    "type": "merchant",
    "attributes": {
      "name": "Store Name"
    }
  }
}
```
### Relationships
