require 'pry'
class Joueur
    attr_accessor :name, :life_points
    
    def initialize(name)
        @name = name
        @life_points = 10
    end

    def showstate
        puts "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(nombre)
        @life_points = @life_points - nombre 
        if @life_points <= 0 
            puts "le joueur a été tué !"
        end
    end
    
    def compute_damage
        return rand(1..6)
    end

    def attacks(target)
        damage = compute_damage
        puts "#{@name} attaque #{target.name} et lui inflige #{damage} points de dommage."
        target.gets_damage(damage)
    end
end

binding.pry


