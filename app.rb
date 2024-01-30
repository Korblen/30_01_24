require_relative('lib/game.rb')
require_relative('lib/player.rb')
require 'pry'

#binding.pry
player1 = Joueur.new('Jean')
player2 = Joueur.new('Jeanne')
player1.showstate
player2.showstate

puts "Passons à la phase d'attaque :"

while player1.life_points > 0 && player2.life_points > 0
    player2.attacks(player1)
    player1.showstate
    if player1.life_points <= 0
        puts "#{player2.name} gagne !"
        break
    end
    player1.attacks(player2)
    player2.showstate
    if player2.life_points <= 0
        puts "#{player1.name} gagne !"
        break
    end
end
