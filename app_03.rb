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
puts "combien d'ennemis vas tu combattre ??"
choix = gets.chomp.to_i

gamese = Game.new(my_game, choix)

while gamese.is_still_going? == true
    system('clear')
    gamese.new_player_in_sight
    gamese.show_players
    gamese.menu
    gamese.menu_choice
    gamese.killplayer
    gamese.ennemies_attack
    gets.chomp
end

gamese.fin_partie