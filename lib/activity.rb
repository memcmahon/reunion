class Activity
  attr_reader :name,
              :total_cost,
              :participants

  def initialize(name, total_cost = 0, participants = {})
    @name         = name
    @total_cost   = total_cost
    @participants = participants
  end
end
