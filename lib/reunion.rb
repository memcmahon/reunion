require './lib/activity'

class Reunion
  attr_reader :location,
              :activities

  def initialize(location, activities = [])
    @location   = location
    @activities = activities
  end

  def add_activity(name, total_cost = 0, participants = {})
    activities << Activity.new(name, total_cost, participants)
  end

  def total_cost
    activities.reduce(0) do |sum, activity|
      sum += activity.total_cost
    end
  end

  def total_paid_per_person
    # people = activities.map do |activity|
    #   activity.participants
    # end
    #
    # people = people.map do |activity|
    #   activity.map do |key, value|
    #     [key, value]
    #   end
    # end.flatten(1)
    #
    # people = people.group_by do |person|
    #   person[0]
    # end

    require 'pry'; binding.pry
  end
end
