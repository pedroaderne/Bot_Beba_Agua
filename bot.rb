require 'discordrb'
require_relative 'lembra'

classe = MeLembra.new()

bot = Discordrb::Commands::CommandBot.new token: 
'ODkxMDc2ODU0Mjg1NDg0MDUy.YU5F_Q.8BETY-LwcuVhq-zUbucykTjFMTQ', prefix: '='

bot.command( :lembrete, max_args: 1 ) do |_event, *args|

  command = "#{ args.at(0).downcase }"

  resp = classe.lembrete(command, _event.user)

  if resp == 0
    _event.respond 'Koe, bora beber agua!'
  elsif resp == 1 
    _event.respond 'So nao esquece de beber agua!'
  end

end

bot.run 