## Ruby on Rails Project work


- https://rubyonrails.org/


- https://www.ruby-lang.org/en/downloads/


- https://rubyinstaller.org/downloads/


- https://guides.rubyonrails.org/getting_started.html


- https://www.jetbrains.com/ruby/


- https://github.com/alexwebgr/phonebook


-https://download-directory.github.io/


- env commands: `ruby`, `sqlite3`, `gem`, `rails`


#### setup project


`rails new <name-project>`


`cd <name-project>`


- install Gemfile dependencies `bundle install`


- Running `bundle update` will rebuild your snapshot from scratch, using only
the gems in your Gemfile, which may resolve the conflict.


#### run project


- run server `bin/rails server` || `rails server`

# The Ruby Phonebook
A Ruby on Rails api-only app with JWT token authentication that exposes a basic CRUD API for managing contacts in a phonebook.

[Hosted in Heroku](https://sheltered-chamber-62543.herokuapp.com)
#### How to register a user

In order to create a new user just call `POST /users` with the mandatory fields, first_name, last_name, email, password.

Then try to login by visiting `POST /sessions/authenticate` and supplying the email and password of the user that was just created.

Copy the `auth_token` and keep it somewhere safe, now you can make calls to the contacts API by passing the `auth_token` as a header like so 
`Authorization:Bearer <auth_token>`   

#### Available endpoints
* `POST /users` with the mandatory fields

* `GET /contacts`
* `POST /contacts` with mandatory fields
* `GET /contacts/:id`
* `PUT /contacts/:id`
* `DELETE /contacts/:id`

Also available as a [postman collection](https://documenter.getpostman.com/view/1699252/SVSNKTQQ?version=latest)

#### Instructions for running the app locally
Firstly you will need ruby installed ideally by using a version manager like [rbenv](https://github.com/rbenv/rbenv)
that lets you have different versions of ruby per directory. This app is using Ruby 2.5.1 and Rails 5.1.7 
it is also depending on postgreSQL to be installed on the host machine.

Run `bundle install` to install all the gems listed in the Gemfile.

#### Database
A visual representation of the database is available under the `schema.xml` file just navigate 
  to this [URL](https://ondras.zarovi.cz/sql/demo/) and paste the contents of the file in the load window.

Make sure that the database credentials listed in `config/database.yml` match the ones for the local database user.  
In order to create the database run `rails db:create` followed by `rails db:schema:load`

#### How to run the test suite
In order to run the test suite just run `bundle exec spec`

#### Starting the app
You can start the application server called 'Puma' by  running `rails s` in your terminal and stop it by hitting `CTRL + c`.
After making any changes to configuration the server has to be restarted for the changes to take effect. 

#### Improvements
* validate phone numbers with [telephone_number](https://rubygems.org/gems/telephone_number)
* Add search endpoint in the contacts API
* Introduce permission groups so only admin level users can manage other users

