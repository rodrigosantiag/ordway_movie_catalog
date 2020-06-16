# README Ordway Movie Catalog

This README documents all steps necessary to get the application up and running locally.

This application is a simple CRUD which user can add, edit and remove movies from a catalog.

Each movie can be added to system with its title, summary, year and genre. Also an IMDB link can be added to movie record.

**Steps:**

* Ruby 2.6.1

* Rails 6.0.3.1

* Database MySQL 5.7.30. In config/database.yml set your database credentials

* Database creation: `rake db:create`

* Database initialization: `rake db:migrate`

* Run `yarn` or `npm install` depending on which one you use

* Start rails server  `rails s`

* On your browser access http://localhost:3000

* Heroku link: https://ordway-movie-catalog.herokuapp.com/
