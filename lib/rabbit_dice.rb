require 'ostruct'
require 'pry-debugger'

require_relative 'rabbit_dice/databases/in_memory.rb'

require_relative 'rabbit_dice/entity.rb'
require_relative 'rabbit_dice/entities/dice_cup.rb'
require_relative 'rabbit_dice/entities/die.rb'
require_relative 'rabbit_dice/entities/game.rb'
require_relative 'rabbit_dice/entities/roll.rb'
require_relative 'rabbit_dice/entities/turn.rb'

require_relative 'rabbit_dice/use_case.rb'
require_relative 'rabbit_dice/use_cases/create_game.rb'
require_relative 'rabbit_dice/use_cases/play_move.rb'

module RabbitDice
  def self.db
    @__db_instance ||= Databases::InMemory.new
  end
end

class Array
  def sum_attr(attribute)
    self.map {|elem| elem.send(attribute) }.reduce(0, :+)
  end
end
