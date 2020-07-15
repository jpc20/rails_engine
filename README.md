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

### CRUD Endpoints  

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
### Relationship Endpoints

#### Index of items associated with a merchant

Request:
```
GET /api/v1/merchants/:id/items
```
Response:
```
body:
{
  "data": [
    {
      "id": "1",
        "type": "item",
        "attributes": {
          "name": "Item Name",
          "description": "Item Description",
          "unit_price": "31163",
          "merchant_id": "1"
        }
    },
    {
      "id": "2",
      "type": "item",
        "attributes": {
          "name": "Another Item Name",
          "description": "Another Item Description",
          "unit_price": "66543",
          "merchant_id": "1"
       }
    }
  ]
}
```

#### Return the merchant associated with an item

Request:
```
GET /api/v1/items/:id/merchant
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
### Find Endpoints

#### Single Finders for items and merchants

Request:
```
GET /api/v1/merchants/find?name=ring
```
Response:
```
{
  "data": {
    "id": 4,
    "type": "merchant",
    "attributes": {
      "name": "Ring World"
    }
  }
}
```

#### Multi Finders for items and merchants
Request:
```
GET /api/v1/merchants/find?name=ring
```
Response:
```
body:
{
  "data": [
    {
      "id": "4",
      "type": "merchant",
      "attributes": {
        "name": "Ring World"
      }
    },
    {
      "id": "1",
      "type": "merchant",
      "attributes": {
        "name": "Turing School"
      }
    }
  ]
}
```
