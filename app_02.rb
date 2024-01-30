require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts '-------------------------'
puts '| Bienvenue dans :       |'
puts '|RISQUER SA POO          |'
puts '-------------------------'

puts "Quel est ton nom guerrier ?"
user_info = gets.chomp.to_s
puts "Bienvenue #{user_info}"

player = HumanPlayer.new(user_info)
bot1 = Joueur.new('José')
bot2 = Joueur.new('Josiane')

ennemies = []
ennemies << bot1
ennemies << bot2

while player.life_points >0 && (bot1.life_points > 0 || bot2.life_points >0)
    player.showstate
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "attaquer un joueur en vue :"
    if bot1.life_points > 0
        print "0 -"
        bot1.showstate
    end
    if bot2.life_points > 0
        print "1 -"
        bot2.showstate
    end
    choix = gets.chomp
    if choix == 'a'
        player.search_weapon
    elsif choix == 's'
        player.search_healthpack
    elsif choix == '0'
        player.attacks(bot1)
        ennemies.delete_if { |ennemi| ennemi.life_points <= 0 }
    elsif choix == '1'
        player.attacks(bot2)
        ennemies.delete_if { |ennemi| ennemi.life_points <= 0 }
    else
        puts "wrong choice mfkr"
    end
    if ennemies.empty? == true
        puts "#{player.name} a gagné !!"
    end
    ennemies.each do |ennemi|
        ennemi.attacks(player)
        if player.life_points < 1
            puts "les bots ont gagné, c'est la fin du monde ..."
            break
        end
    end
end