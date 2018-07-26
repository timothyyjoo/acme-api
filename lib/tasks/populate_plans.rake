desc "Load database with plans"
  task :create_plans => :environment do
    Plan.create(name: "Bronze Box", price: "1999")
    Plan.create(name: "Silver Box", price: "4900")
    Plan.create(name: "Gold Box", price: "9900")
  end
