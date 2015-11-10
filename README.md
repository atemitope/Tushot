
# README
## Tushot 

[![Circle CI](https://circleci.com/gh/andela-atemitope/Tushot/tree/working_url_shortener.svg?style=svg)](https://circleci.com/gh/andela-atemitope/Tushot/tree/working_url_shortener)
### Overview

[*www.tushot-heroku.com*](tushot.heroku.com)

Tushot is an advanced military Url shortener. As the name implies it simply uses its ammunition powered by Rails 4 to shoot your long Urls and leave them in short concise strings. These short strings are actually redirected to the assigned url and when clicked, they record the neccesary statistics and redirect to the designated Url
 There are two kinds of users, you can either be :

**Regular User** 

  As a regular user you visit Tushot.heroku.com and input your url in the form provided then "shoot" it. you will be presented with your short url
  Regular users also get access to overall statistical data from Tushot HQ
  
----------


**Registered Users**

 Registered Users can comfortably specify a given word or string for more enhanced shortening. If the word or string is chosen a random one is generated for you in its place. Registered Users can visibly affirm the amount of Urls they have shortened including their most popular and most recent Urls


## Using the Application

### Dependencies

Tushot is built with version 4.2.4 the popular Rails framework using the Ruby programming language (version 2.1.5). Chances are you already have Ruby and Rails installed. You can run __which ruby__ and __which rails__ to check for their installation.

* You can download Ruby if you are a windows user: www.rubyinstaller.org, and if you are using a macbook you can download it from https://www.ruby-lang.org/en/downloads/

* You can download Rails from https://www.ruby-lang.org/en/downloads/ for both Windows and Mac users 

*   if Ruby is not installed checkout the [ruby installation guide](https://www.ruby-lang.org/en/downloads/) for guidelines to setup Ruby on your machine
*   if Rails is not installed checkout the [Rails installation guide](http://rubyonrails.org/download/) for guidelines to setup rails on you machine.

Also check for and confirm the [installation of gem](http://guides.rubygems.org/rubygems-basics/) and [bundler](http://rubygems.org) on your machine. These will allow you install other libraries ( _gems_ ) required by Tushot.

### Running the application

First [clone this repo](clone). Then from your terminal (or command prompt) navigate to the folder where you have cloned Tushot( __cd path/to/Tushot/__ ).

*   Run __bundle install__ to install all Tushot dependencies.
*   Run __rake db:migrate__ to setup the app database
*   Run __rails server__ to start the rails server

You now good to go. Visit the app on your browser to use Tushot (localhost:3000)

### Running the tests

Tushot prides it's self in being fully tested. Tushot is tested using [rspec](http://rspec.info/), [capybara](http://jnicklas.github.io/capybara/), [faker](https://github.com/stympy/faker) and [factory_girl](http://www.rubydoc.info/gems/factory_girl/file/GETTING_STARTED.md) gems. To start the test, first migrate the test database by running __rake db:migrate__. Next run __bin/rspec spec__ to run all tests. You can also specify a particular test from the spec folder to run. Run tests with the _-fd_ flag to view the tests documentation.

## App features

*   Creates _Tushot's_for users if not custom string is provided
*   Creates customized _Tushot's_for users if given a custom string
*   Keeps tabs of most recent _Tushots_
*   Keeps tabs of popular _Tushots_
*   Provides visit statistics for registered users

## Contributing
1. Fork the repo.
2. Run the tests. We only take pull requests with passing tests, and it's great
to know that you have a clean slate: `bundle && bundle exec rake`
3. Add a test for your change. Only refactoring and documentation changes
require no new tests. If you are adding functionality or fixing a bug, we need
a test!
4. Make the test pass.
5. Push to your fork and submit a pull request.

#####Syntax:

* Two spaces, no tabs.
* No trailing whitespace. Blank lines should not have any space.
* Prefer `&&`, `||` over `and`, `or`.
* `MyClass.my_method(my_arg)` not `my_method( my_arg )` or `my_method my_arg`.
* `a = b` and not `a=b`.
* Follow the conventions you see used in the source already.
* Deployment instructions

* ...

