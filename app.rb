require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:homepage)
end

get("/rock") do
  @hand = ["rock","paper","scissors"].sample
  if @hand == "rock"
    @outcome = "We tied!"
  elsif @hand == "scissors"
    @outcome = "We won!"
  else
    @outcome = "We lost!"
  end
  erb(:rock)
end

get("/paper") do
  @hand = ["rock","paper","scissors"].sample
  if @hand == "rock"
    @outcome = "We won!"
  elsif @hand == "scissors"
    @outcome = "We lost!"
  else
    @outcome = "We tied!"
  end
  erb(:paper)
end

get("/scissors") do
  @hand = ["rock","paper","scissors"].sample
  if @hand == "rock"
    @outcome = "We lost!"
  elsif @hand == "scissors"
    @outcome = "We tied!"
  else
    @outcome = "We won!"
  end
  erb(:scissors)
end
