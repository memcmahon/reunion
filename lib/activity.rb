class Activity
  attr_reader :name,
              :participants

  def initialize(name, participants = {})
    @name         = name
    @participants = participants
  end

  def total_cost
    sum = 0
    participants.each do |name, amount|
      sum += amount
    end
    sum
  end
end
