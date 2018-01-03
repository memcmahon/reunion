require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def test_it_has_a_location
    reunion = Reunion.new("Carbondale")

    assert_instance_of Reunion, reunion
    assert_equal "Carbondale", reunion.location
  end

  def test_it_has_activities
    hiking = Activity.new('hiking')
    cycling = Activity.new('cycling')
    reunion = Reunion.new('Carbondale', [hiking, cycling])

    assert_instance_of Array, reunion.activities
    assert_instance_of Activity, reunion.activities[0]
  end

  def test_activities_can_be_added_to_reunion
    hiking = Activity.new('hiking')
    cycling = Activity.new('cycling')
    reunion = Reunion.new('Carbondale', [hiking, cycling])

    reunion.add_activity('fishing')

    assert_equal 3, reunion.activities.count
  end

  def test_it_can_calculat_total_cost
    hiking = Activity.new('hiking', 15, {"Megan" => 5,
      "Molly" => 10,
      "Connor" => 0})
    cycling = Activity.new('cycling', 45, {"Megan" => 15,
      "Molly" => 0,
      "Connor" => 30})
    fishing = Activity.new('fishing', 72, {"Megan" => 20,
      "Molly" => 40,
      "Connor" => 20})
    reunion = Reunion.new('Carbondale', [hiking, cycling, fishing])

    total_cost = reunion.total_cost

    assert_equal 132, total_cost
  end
end
