
class Luhn
  def self.check(nums)
    nums = nums.split(//).map(&:to_i)

    doubled = double_odds(nums)
    total   = separate_and_sum(doubled)
    total % 10 == 0
  end

  def self.double_odds(nums)
    nums.each_with_index do |n, idx|
      nums[idx] *= 2 if idx.odd?
    end
  end

  def self.mod_ten(n)
    (n % 10) + 1
  end

  def self.separate_and_sum(nums)
    nums.inject do |sum, n|
      sum += n > 9 ? mod_ten(n) : n
    end
  end
end

p Luhn.check "1762483" # Should be true
p Luhn.check "1762485" # Should be false
