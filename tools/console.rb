require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

vc = VentureCapitalist.new("Daniel", 1000000000000)
su = Startup.new("Dani's", vc, "ooo" )

fd = FundingRound.new(su, vc, "mine", 2000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line