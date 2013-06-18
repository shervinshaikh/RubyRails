# module Playable
#   def w00t
#     @health += 15
#     puts "#{@name} got w00ted!"
#   end
#   
#   def blam
#     @health -= 10
#     puts "#{@name} got blammed!"
#   end
#   
#   def strong?
#     @health > 100
#   end
# end

module StudioGame
  module Playable
    def w00t
      self.health += 15
      puts "#{name} got w00ted!"
    end
  
    def blam
      self.health -= 10
      puts "#{name} got blammed!"
    end
  
    def strong?
      self.health > 100
    end
  end
end