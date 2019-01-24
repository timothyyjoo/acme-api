# README

This is an implementation of a backend API written in the Ruby on Rails framework.

The project management workflow can be viewed at https://www.pivotaltracker.com/n/projects/2186814



1. Run bundle install && bundle exec figaro install
	- After running bundle exec figaro install, your directory should have an application.yml file. Inside that file, please include a line similar to the sample below, but with your API key inserted where appropriate.

	fakepay_api_key: 85213e2093d9312bcdc67e75c24234

2. In CLI, type rake db:create db:migrate

3. To populate the database with plans, please type rake create_plans in CLI.

4. Run this API locally by typing rails s in CLI

5. The port should be set to "http://localhost:3000"

6. The uri to submit POST requests is "/api/v1/customers"

7. Please see the sample POST request body for an idea on how to format your JSON POST request.

Sample POST Request body

{
	"customer": {
		"first_name": "Jim",
		"last_name": "Jones",
		"address": "2120 Wimbeldon Court",
		"city": "Modesto",
		"state": "CA",
		"zip": 95355
	},
	"amount": "4900",
	"card_number": "42424242424242420",
	"cvv": "123",
	"expiration_month": "01",
	"expiration_year": "2024",
	"zip_code": "11754",
	"plan_id": "2"
}
-Please note that the following fields for customer object is required: first_name, last_name, address, city, state, zip

8) This API has been designed to output all relevant errors as JSON messages

9) Run bundle exec rspec or rake to see all associated tests.

10) Code Review: I believe my error handling could be cleaned up or made more modular. I looked into creating a method in application controller to standardize my error messages but ran into some confusion trying to implement the method in my controller due to validations occurring in model files which do not have access to render method.
