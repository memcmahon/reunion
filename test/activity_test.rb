require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_it_has_name
    activity = Activity.new('hiking')

    assert_instance_of Activity, activity
    assert_equal 'hiking', activity.name
  end

  def test_it_has_participants
    activity = Activity.new('hiking', 15, {"Megan" => 5,
      "Molly" => 5,
      "Connor" => 0})

    assert_equal 5, activity.participants["Molly"]
    assert_equal 3, activity.participants.count
  end

  def test_participants_can_be_added_to_activities
    activity = Activity.new('hiking', 15, {"Megan" => 4,
      "Molly" => 5,
      "Connor" => 0})

    activity.add_participant("Andy", 6)

    assert_equal 4, activity.participants.count
    assert_equal 6, activity.participants["Andy"]
  end

  def test_activity_has_total_cost
    activity = Activity.new('hiking', 15, {"Megan" => 4,
      "Molly" => 5,
      "Connor" => 0})

    assert_equal 15, activity.total_cost
  end

  def test_it_can_calculat_cost_per_participant
    activity = Activity.new('hiking', 15, {"Megan" => 4,
      "Molly" => 5,
      "Connor" => 0})

    cost_per_participant = activity.cost_per_participant

    assert_equal 5, cost_per_participant
  end

  def test_it_can_calculat_what_each_participant_owes
    activity = Activity.new('hiking', 15, {"Megan" => 5,
      "Molly" => 10,
      "Connor" => 0})

    owed = activity.participants_owe

    assert_instance_of Array, owed
    assert_equal 5, owed[2]["Connor"]
    assert_equal -5, owed[1]["Molly"]
  end
end
