# Welcome to CTOConnection

CTOConnection is a tool for building a community.

## Technologies

* Rails 6, Postgres
* Rubocop for code style. Run `rubocop` before pushing to repository to avoid offenses.
* RSpec for tests. Run `rspec` before pushing to repository to avoid test failures.

## Installation

Assuming you're running on a mac or some flavor of Linux:
* Install postgres if you don't have it
* Start postgres if it isn't running
* Install ruby-2.7.2 if you don't already have it
* Use your ruby environment manager of choice (.rvm, .rb_env, etc) to create and then run a "ctoconnection" ruby environment under ruby-2.7.2
* Install rails (`gem install rails -v 6.0.3.4`)
* run `bundle` to install necessary gems
* run `yarn install --check-files` to install node modules
* Create the database files (`rails db:create`)
* [Setup Credentials](##setup-credentials)
* Run any pending database migrations (`rails db:migrate`)
* Seed database (`rails db:seed`)
* Install foreman (it's [not supposed to be in the gemfile](https://github.com/ddollar/foreman/wiki/Don't-Bundle-Foreman)) - `gem install foreman`
* Start rails using foreman (`foreman start`)
* Test the app is running OK by going to http://localhost:5000/ 

## Setup Credentials

To setup credentails we use `.env` file. Copy the example of env file `mv .env_example .env`)

## Configure your heroku remotes

Instructions for configuring your terminal to be able to push to cdx connection as well (the second Heroku app running the CTOConnection code base). This is only required if you need to be able to push to production.

* Make sure you've been added as a collaborator to both ctoconnection and cdxconnection on Heroku
* In your terminal window, in the ctoconnection directory, run the following command
`heroku git:remote -a ctoconnection`
* Then use a text editor to edit .git/config
* Find the remote named "heroku" and replace heroku with "cto" & save the file
* In your terminal window, in the ctoconnection directory, run the following command
`heroku git:remote -a cdxconnection`
* Then use a text editor to edit .git/config
* Find the remote named "heroku" and replace heroku with "cdx"  & save the file
* try to `git push cto` to push to CTO Connection and `git push cdx` to push to CDX Connection
