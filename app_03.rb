require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts '-------------------------'
puts '| Bienvenue dans :       |'
puts '|RISQUER SA POO          |'
puts '-------------------------'

puts "Quel est ton nom guerrier ?"
my_game = gets.chomp.to_s
puts "Bienvenue #{my_game}"
gets.chomp

gamese = Game.new(my_game)

while gamese.is_still_going? == true
    gamese.show_players
    gamese.menu
    gamese.menu_choice
    gamese.killplayer
    gamese.ennemies_attack
end

gamese.fin_partie