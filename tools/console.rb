require_relative '../config/environment.rb'
# require_relative '../app/'

def reload
  load 'config/environment.rb'
end
# (name, founder,domain)
startup1 = Startup.new("Startup 1", "Sam", "Domain1")
startup2 = Startup.new("Startup 2", "Nicole", "Domain2")
startup3 = Startup.new("Startup 3", "Kyle", "Domain3")
startup4 = Startup.new("Startup 4", "Derick", "Domain4")

#(name, total_worth)
capitalist1 = VentureCapitalist.new("Max", 100_000)
capitalist2 = VentureCapitalist.new("Rakshan", 1_000_000)
capitalist3 = VentureCapitalist.new("Muhidin", 500_000)
capitalist4 = VentureCapitalist.new("Ronalyssa", 100_000_000_000)

#(startup, venture_capitalist, type, investment)
round1 = FundingRound.new(startup1, capitalist1, "Pre_Seed", 125_000.50)
round2 = FundingRound.new(startup2, capitalist2, "Seed", 100_000_000.23)
round3 = FundingRound.new(startup3, capitalist3, "Series A", 1_000_000_000)
round4 = FundingRound.new(startup2, capitalist1, "Series B", 25_000_000.30)


# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line