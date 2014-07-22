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


####Starting the database
It's very important that everytime you want to use your database, you have to open a new terminal window and type that:

```
postgres -D /usr/local/var/postgres
```

Don't close it while you're using your db.

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


```
#controllers/locations_controller.rb
class LocationsController < ApplicationController
	def index
		@locations = Location.order('created_at DESC').limit(10)
	end
end
```


```
	#views/locations/index.html.erb
	<table class="table">
  		<% @locations.each do |l| %>
  			<tr>
  				<td><%=l.name %></td>
  				<td><%=l.city %></td>
  				<td><%=l.description %></td>
  				<td><%=l.zip_code %></td>
   			</tr>
		<%end%>
```


As you can see, you save the result of a query from the controller, and then you can print it in the view as a table, for example.

####Scopes in Ruby
You can see in the [ruby guide][5] what scopes are:

>Scoping allows you to specify commonly-used queries which can be referenced as method calls on the association objects or models. With these scopes, you can use every method previously covered such as where, joins and includes. All scope methods will return an ActiveRecord::Relation object which will allow for further methods (such as other scopes) to be called on it.

####Testing Controllers

Now, imagine you want to send by url the id of a location, and then show this specific location.

Before anything, we should test. So, let's write what do we want to test in the location controller testing file, which was created authomatically when we created the controller. 

```
#spec/controllers/locations_controller_spec.rb
require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do
	describe "GET #show:id" do
		before (:each) do
		  	@location = Location.create!(name: 'Murcia', description: 'Hot City')
		    get :show, id: @location.id
		end
		it "responds successfully with an HTTP 200 status code" do
      		expect(response).to be_success
      		expect(response).to have_http_status(200)
		end

		it "render show template" do
	      expect(response).to render_template :show
		end
	end
end
```

Run the test typing the following command: 

```
rake spec:controllers
```

We use this command instead of 'rspec' in order to test only the controllers tests. 
The tests fail, so we have to implement the methods in order to make it work.

In routes.rb, add the line:

```
get 'locations/:id' => 'locations#show'
```

And then, in app\views\locations, you will have to create a new view called **show.html.erb**


**NOTE!**

We can see in the previous test this line: 
```expect(response).to have_http_status(200)```

We know that that means that the response is ok. Rails has his own words for that, because sometimes it's hard to remember every status number. We can write the following line instead of that:
```expect(response).to have_http_status(:ok)```

In this [website][6] you can find all the words that are equivalent to the number status, so it will be easier for you and also for the others to understand your code


**Note** It is possible that you want to test if a request is not found. If you are using a find_by query, remember that it returns "nil", so it is going to be "found".


####Creating layouts

In the repo, you might have seen that in the different layouts there is no <header> or <body> tags, so... How do we render every html file including bootstrap style and javascript files?

The answer is that everything you want to include in every page, as a header, style whatever, should be in the following file:

```app/views/layouts/application.html.erb```



If you don't want to use it in your page, you can change it in your controller (remember that the controller is the middle man between the model and the view), you have to **overwrite** this layout with another layout. You can do that adding a render inside the controller functions, for instance:

####Foreign Keys
Now, let's create another table called "Visits". 
Remember --> new model --> ```rails g model visit```

Go to the migrations (if you don't remember how, read again how we did it with locations)
and create another table. In the repo, you can see it at #db/migrate#xxxxx_create_visits.rb

If we want to create the foreign key, we have to go to the **model** and write the following lines:

```
#app/models/visit.rb
	belongs_to :location
```

```
#app/models/locations.rb
	has_many : visits
```

Check that location is in singular and visits is in plural, because a visit belongs only to one location, but a location can have a lot of visits. **Remember to follow the Rails conventions.**

[1]: http://api.rubyonrails.org
[2]: http://apidock.com/rails
[3]: http://github.com/rails/rails
[4]: http://ruby-doc.org
[5]: http://guides.rubyonrails.org/active_record_querying.html
[6]: http://futureshock-ed.com/2011/03/04/http-status-code-symbols-for-rails/


