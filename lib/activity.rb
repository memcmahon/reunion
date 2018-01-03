class Activity
  attr_reader :name,
              :total_cost,
              :participants

  def initialize(name, total_cost = 0, participants = {})
    @name         = name
    @total_cost   = total_cost
    @participants = participants
  end

  def add_participant(name, amount)
    participants[name] = amount
  end

  def cost_per_participant
    total_cost / participants.count
  end

  def participants_owe
    participants.map do |name, amount|
      {name => cost_per_participant - amount}
    end
  end
end
