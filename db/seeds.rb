# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!( name: "Example User",
              email: "example@example.com",
              password: "foobar",
              password_confirmation: "foobar",
              admin: true,
              activated: true,
              activated_at: Time.zone.now )
              
budget = user.budgets.create!( title: "My First Budget" )

budget.incomes.create!( source: "Income source 1", 
                        amount: 1234.50 )
budget.incomes.create!( source: "Income source 2",
                        amount: 4321.50 )
                        
                        
second_user = User.create!( name: "Second User",
                            email: "example2@example.com",
                            password: "foobar",
                            password_confirmation: "foobar",
                            activated: true,
                            activated_at: Time.zone.now )
                            
second_budget = second_user.budgets.create!( title: "Second User Budget")

second_budget.incomes.create!( source: "Second Income 1",
                                amount: 1234.50 )
                                
second_budget.incomes.create!( source: "Second Income 2",
                                amount: 4321.50 )