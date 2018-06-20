require 'minitest/autorun'

class QuickSortTest < Minitest::Test
  def test_simple
    assert_equal [1,2,3,4,5], quick_sort([2,3,4,5,1])
  end

  def test_repeated_numbers
    assert_equal [1,1,1,2,2,3], quick_sort([2,2,3,1,1,1])
  end

  def test_negative_numbers
    assert_equal [-1,2,3,4,5], quick_sort([5,3,2,-1,4])
  end

  def test_sorting_twice
    list = [5,4,3,2,1]

    assert_equal [1,2,3,4,5], quick_sort(list)
    assert_equal [1,2,3,4,5], quick_sort(list)
  end

  def test_empty_list
    assert_equal [], quick_sort([])
  end
end
