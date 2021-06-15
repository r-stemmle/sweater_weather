# Sweater Weather
*Plan your next road trip with weather and books in mind!*

Turing School of S&D Back-End Engineering **SOLO** final project for module 3

Learning Goals:
 - Expose an API that aggregates data from multiple external APIs
 - Expose an API that requires an authentication token
 - Expose an API for CRUD functionality
 - Determine completion criteria based on the needs of other developers
 - Research, select, and consume an API based on your needs as a developer

#### Endpoints  
*required headers: Content-Type: application/json, Accept: application/json*  
**An API key can be generated by creating a POST request (3rd endpoint)**

`GET /api/v1/forecast`  **required params: "location"**  
`GET /api/v1/backgrounds`  **required params: "location"**  
`POST /api/v1/users`  **body must include: "email", "password", and "password_confirmation"**  
`POST /api/v1/sessions`  **body must include: "email" and "password"**  
`POST /api/v1/road_trip`  **body must include: "origin", "destination", and "api_key"**  
`GET /api/v1/book-search`  **required params: "location"** *optional: "quantity"*

##### Sample Reqests

```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```

```
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
```

```
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
}
```

```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983xxxxxxxx"
}
```

#### Versions
 * sweater_weather api v1.0
 * Ruby 2.5.3  
 * Rails 6.1.3.2

#### Necessary Gems  
 * [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)  
 * [faraday](https://github.com/lostisland/faraday)  
 * [figaro](https://github.com/laserlemon/figaro)

#### Design Ideas  
Sweater Weather is a RESTful API designed with RESTful routes and actions in mind..  
Meaning the POST request goes to a create action and the get goes to a show or index action.

#### Database  
 * [PostgreSQL](https://www.postgresql.org/)  
 * `Users` model  
 * Facade, Service, PORO framework for additional objects

#### Testing
 * [rspec-rails](https://github.com/rspec/rspec-rails)  
 * `bundle exec rspec`

#### API consumption
 * [openlibrary api](https://openlibrary.org/dev/docs/api/books)  
 * [open weather map](https://openweathermap.org/api/one-call-api)
 * [mapquest api](https://developer.mapquest.com/documentation/)  

#### Run Sweater Weather on your machine  
 * `git clone`
 * `cd sweater_weather`
 * `bundle install`
 * `rails db:create`
 * `rails db:migrate`
 * `rails server`
