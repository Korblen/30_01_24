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

class HumanPlayer < Joueur
    attr_accessor :weapon_level
  
    def initialize(name)
      super(name) # Appel du constructeur de la classe parente (Joueur)
      @life_points = 100
      @weapon_level = 1
    end

    def showstate
        puts "#{name} a #{life_points} points de vie et un niveau d'arme de #{weapon_level}"
    end
    
    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        weapon = rand(1..6)
        puts "tu as trouvé une arme de rang #{weapon}"
        if @weapon_level < weapon
            puts "Ouais elle est mieux que ton arme de rang #{weapon_level}, tu la prends !!"
            @weapon_level = weapon
        elsif @weapon_level == weapon
            puts "tu as déja une arme de ce rang la"
        else
            puts "c'est de la merde cette arme mdr"
        end
    end

    def search_healthpack
        luck = rand(1..6)
        if luck == 1
            puts "tu n'as rien trouvé"
        elsif luck < 6
            puts "tu as trouvé un pack de 50 pv !"
            @life_points = @life_points + 50
            if @life_points > 100
                @life_points = 100
            end
        else 
            puts "tu as trouvé un pack de 80 pv !!"
            @life_points = @life_points + 80
            if @life_points > 100
                @life_points = 100
            end
        end
    end


end

binding.pry


