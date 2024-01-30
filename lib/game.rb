class Game 
    attr_accessor :player, :ennemies
    NAMES = ["Adélaïde","Agnès","Aimé","Alain","Albert","Aline","Amélie","Anastasie","André","Anne","Antoine","Auguste","Aurélie","Béatrice","Blaise","Camille","Célestin","Célestine","César","Charlotte","Clément","Clémence","Clotilde","Colette","Denis","Éléonore","Élisabeth","Éloi","Émilie","Eugène","Eulalie","Évariste","Fabien","Félicie","Félix","Florence","Florent","Gabrielle","Gaston","Géraldine","Gérard","Germaine","Gilbert","Gisèle","Gustave","Hélène","Henri","Hortense","Hubert","Isabelle","Jacques","Jean","Josèphe","Joséphine","Jules","Juliette","Justine","Léon","Léonie","Léontine","Louise","Lucien","Lucienne","Madeleine","Marcel","Marceline","Marguerite","Marius","Mathilde","Maurice","Monique","Odette","Olivier","Pascal","Paulette","Philippe","Rosalie","Roseline","Rosette","Sébastien","Solange","Suzanne","Thérèse","Valentin","Valérie","Victor","Victorine","Violette","Virginie","Yvonne","Zacharie","Zéphyr","Zoé","Zoémie","Zéphirin","Zoélie","Zulma","Zéphyrine","Zénobie","Zénon"]

    def initialize(name)
        @player = HumanPlayer.new("#{name}")
        choix = 4
        @ennemies = []
        for i in 1..choix
            name_gen = rand(0..99)
            current_name = NAMES[name_gen]
            bot1 = Joueur.new(current_name)
            @ennemies << bot1
        end
    end

    def killplayer
        @ennemies.delete_if { |ennemi| ennemi.life_points <= 0 }
    end

    def is_still_going? 
        if @ennemies.empty? == false && @player.life_points > 0
            return true
        else
            return false
        end
    end

    def show_players
        puts "#{@player.name} a #{@player.life_points} pv"
        puts "il reste #{@ennemies.length} ennemis"
    end

    def menu
        puts "Quelle action veux-tu effectuer ?"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner"
        puts "attaquer un joueur en vue :"
        compteur = 0
        @ennemies.each do |ennemi|
            puts "#{compteur} - #{ennemi.name} a #{ennemi.life_points} pv"
            compteur = compteur + 1
        end
    end

    def menu_choice
        choice = gets.chomp
        case choice
        when "a"
            @player.search_weapon
        when "s"
            @player.search_healthpack
        when "q"
            exit(0) # Quitter le jeu
        else
            if choice.to_i.between?(0, ennemies.length - 1)
                @player.attacks(ennemies[choice.to_i])
            else
                puts "Choix incorrect !"
            end
        end
    end

    def ennemies_attack
        @ennemies.each do |ennemi|
            ennemi.attacks(@player)
            if @player.life_points <= 0 
                break
            end
        end
    end

    def fin_partie
        puts "C'est la fin de la partie !!"
        if @ennemies.empty? == true
            puts"Vous avez gagné !"
        else
            puts "Loser mdrrr"
        end
    end

end