# Free Photo Getter

This app help you get the wonderful photo.

You can use this app follow by link [heroku](https://github.com/yashka713/unsplash)
===============
Staging:  [circleci](https://circleci.com/gh/yashka713/unsplash/tree/master)

* Ruby version: **2.4.1**

Install
-----------------
```
git clone https://github.com/yashka713/unsplash.git && cd your_repo
bundle install
```
Launch
------------
```
bundle exec rails s
```
Navigate to [http://localhost:3000](http://localhost:3000)

* I used next GEM's for development:
1. gem 'slim-rails' for view
1. gem 'rubocop' for checking style of code
1. gem 'httparty' for HTTP-requests
1. gem 'figaro' for Environment

* I used next GEM's for tests:
1. gem 'rspec-rails'
1. gem 'capybara'
1. gem 'vcr'
1. gem 'webmock'

* App works without any *DB*
Test
-------------
`rubocop && rspec`

* Created by Yaroslav Liakh
