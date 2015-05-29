
def check_luhn(nums)
  nums = nums.split(//).map(&:to_i)

  def double_odds(nums)
    nums.each_with_index do |n, idx|
      nums[idx] *= 2 if idx.odd?
    end
  end

  def separate_and_sum(nums)
    sum = 0
    nums.each_with_index do |n, idx|
      if n > 9
        sum += (nums[idx] % 10) + 1
      else
        sum += n
      end
    end
    sum
  end

  doubled = double_odds(nums)
  total   = separate_and_sum(doubled)
  total % 10 == 0
end

p check_luhn "1762483"
