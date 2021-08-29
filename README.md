# Tweetable

This is Tweetable a simpler version of Twitter.

## Instructions

- Clone this repo on your local machine.
- Run `bundle install`
- Setup your datababase:
  - `rails db:create`
  - `rails db:migrate`
  - `rails db:seed`
- Start the server `rails s`

## Software version

This application runs

- ruby version '2.7.0'
- rails version '6.0'
- rspec core '3.10'
- rspec-rails '5.0'

## Endpoints

Here the list of available endpoints.

Users:

- GET /api/users
- GET /api/users/:id
- PATCH /api/users/:id
- DELETE /api/users/:id

Tweet:

- GET /api/tweets
- GET /api/tweets/:id
- PATCH /api/tweets/:id
- DELETE /api/tweets/:id

## Testing

RSpec is used to test these endpoints.
To execute them, run

```
bundle exec rspec spec/requests
```
