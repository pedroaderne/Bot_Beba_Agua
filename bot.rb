require 'discordrb'
require 'dotenv/load'
require_relative 'lembra'

classe = MeLembra.new()

bot = Discordrb::Commands::CommandBot.new token: 
ENV['TOKEN'], prefix: '='

bot.command( :lembrete, max_args: 1 ) do |event, *args|

  command = "#{ args.at(0).downcase }"

  resp = classe.lembrete(command, event.user)

  if resp == 0
    event.respond 'Koe, bora beber agua!'
  elsif resp == 1 
    event.respond 'So nao esquece de beber agua!'
  end

end

bot.run 