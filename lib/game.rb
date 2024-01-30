class Joueur
    attr_accessor :name, :life_points
    
    def initialize(name)
      @name = name
      @life_points = 10
    end
  end

  def showstate(life_points)
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(nombre)
    @life_points = @life_points - nombre 
  end


