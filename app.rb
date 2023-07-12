require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:homepage)
  "
  <h1>Welcome to Rock Paper Scissors!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/rock") do
  hand = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
  @outcome = "We played Rock!and a #{second_die} for a total of #{sum}."
  erb(:rock)
end
