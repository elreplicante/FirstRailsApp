##Rails Project

###Install rails and create scaffolding
	> rails new meet_me \
	--skip-bundle \
	--database=postgresql \
	--skip-test-unit


* Scaffolding
	* app
		* assets
			* js
			* css
			* img
			* ...
		* controllers
			* application_controler.rb
			* concerns
		* helpers
			* application_helper.rb
		* models
			* *everything you want to build*
			* concerns
		* views	 
			* *everything you want to get as a result (webpages)*
			* layouts
				* index.html.erb
				



* Gemfile
	* Gems you want to use in your project, which includes functionalities you'll need in your project. **Libraries we'll need in the application**	
	* we commented the coffeescript gem and then we added the following line to use rspec for testing:


	>	gem 'rspec-rails', group: [:test, :development]

**IMPORTANT**
in the gemfile, you have to include just after the first line (source...) the ruby version you have

in my case: 

	> 	#ruby=2.0.0
	    ruby '2.0.0'

postgres -D /usr/local/var/postgres

*Note: If you have any problems, which is very probably, just type the errors you find in the terminal and look for it in google =D*


###Model View Controller

####Model

* Internal Representation of Logic
* A model is meant to solve one **specific task** 

####View
* It respresents some output
* It just gets some data from the model and generates an output representation


####Controller
* Is like the "middle man"
* It takes the request (whatever) and thinks what should he do.
* It's between the model and the view


**Why not directly from model to view and viceversa?**
Because what do we want is to be able to refactor, reuse our code. View can be stupid, and it's easier to exchange parts. 

####MVC in RoR

* Generate a controller

```
rails g controller home	
```
It will be created in app/controllers/home_controller.rb

There, we have to create a render like this: 

```
#app/controllers/home_controller.rb
class HomeController < ApplicationController
	def welcome
		render "welcome"
	end
end
```

After that, we have to edit the file config/routes.rb

```
get 'home' => 'home#welcome'
```

Now, you have to create the view!

```
	#app/views/home/welcome.html.erb
	<h1>Welcome!</h1>
```


To see your code in the server, go to the browser and type

>	localhost:3000/home

*Note: this is the porty I have by running the server, it may change*
	


Your main page has to be defined in the config file by: root 'home#welcome' (for example)


####Naming conventions

* Controller Name = view folder name
* Name = template file name

You have to follow this conventions in order to write less code and make it better.


* Cool info: 
	* [api.rubyonrails][1]
	* [apidock][2]
	* [github/rails][3]
	* [ruby doc][4]
	* ```bundle open activerecord```
	



*Note: I've added in my project boootstrap in order to create the views more atractive*

####CRUD
Create, Read, Update, Delete (from database, API, filesystem)

Single responsibility principle: an object should has only one single responsibility.


####The first model:

#####Model: Location
* it will be stored in database
* it will have a name

Generate the model:

```rails g model location```

As you can see in the command line, it also generates the test files, because of course you want to test it! =D

```
invoke  active_record
      create    db/migrate/20140721093846_create_locations.rb
      create    app/models/location.rb
      invoke    rspec
      create      spec/models/location_spec.rb
```

Then, if you go to the file location.rb in app/models

```
class Location < ActiveRecord::Base
end
```

What is ActiveRecord?

* ORM (Objectrelational mapping) included in Ruby on Rails
* Maps Ruby objects to the database
* How does it work? -> it creates a DB
	* Classes are mapped to tables
	* Objects are mapped to rows 
* For example: 
	* ```set_table_name 'location'```

* It follows the name convention in Rails
* As you can see, rails has pluralized the name location into locations when you create a table.


**Note: to use the console, type: ```rails c```

Then, if you go to app/db/migrate/xxxxxxx_create_locations.rb
	You'll see how rails has created a table with the name in plural
	
There you can do any modifications, in our file it has to look like that

```
class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
     t.string :name
      t.timestamps
    end
  end
end
```


Then, you should type in the terminal: ```rake db:migrate ```

> Important:
whenever you do migrations, you are not editing your database. In order to avoid doing the same a lot of times. 

In your migration files, you find that you has a t.timestamps which is a date that helps you to know what is the latest version of a modification, for example. 

There is an authomatically column id that rails create for you =D 

Timestamp attributes:

* created_at
* updated_at
* **These values shouldn't be EVER modified by you**
	
Migrations commands:

* create_table :table_name
* add_column :table_name, :column_name, :type
* remove_column :table_name, :column_name, :type

Create new migration: 
rails -g migration <migration_name>

####Creating new objects

* You can create new objects in rails using different ways. 
* Open the rails console: ```rails c```
* Then type:
	* ```l = Location.new```
	* ```l.name = "Home"```
	* ```l.city = "Barcelona"```
	* ```l.save```

This is just an example. You can also type:
	* ```l = Location.create name:'Home', city: 'Barcelona'```
	* ```l.save```


####Testing with RSpec

Don't forget to execute the next line:
```rails g rspec:install```

It will generate a file called .rspec
If you don't want to see the warnings, open that file and remove the line: --warnings

Then, to execute the tests:

```rake rspec```

####Seeding the database
There is a file in db/seeds.rb, where you can add the lines you want to execute, and it will do it instead of using the comand line.

To execute that file, you have to type:

```rake db:seed```

And for example, if you want to drop all that you have in your database and then execute the seed file, type:

```rake db:drop db:setup```



####Requesting Data
Database comunicates with the Model.

#####Implementing the first request =D

```
#config/routes.rb
Rails.application.routes.draw do
	get 'locations' => 'locations#index'
end
```




[1]: http://api.rubyonrails.org
[2]: http://apidock.com/rails
[3]: http://github.com/rails/rails
[4]: http://ruby-doc.org
[5]: 


