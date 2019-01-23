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

6. The uri to submit POST requests is "/api/v1/subscriptions"

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

8) This API has been designed to output all relevant errors within the console. Please check the appropriate error messages / codes with the details listed on the Fakepay.io error tables.

9) Run rake to see all associated tests.

10) I experimented with using serializers to display certain customer info but didn't dive too deeply due to the idea that I wasn't sure just how much customer information or information in general I wanted to expose.
