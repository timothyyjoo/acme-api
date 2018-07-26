# README

This is an implementation of a backend API written in the Ruby on Rails framework.

The project management workflow can be viewed at https://www.pivotaltracker.com/n/projects/2186814

1. Run bundle install


To populate the database with plans, please type rake populate_plans in CLI.


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
	"plan_id": 2

}
