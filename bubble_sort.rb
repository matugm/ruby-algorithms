
nums = [4,7,1,2,9,3,5]

indexes =
nums.map.with_index { |n, idx| idx }.each_cons(2)

nums.size.times do
  indexes.each do |a, b|
    nums[a], nums[b] = nums[b], nums[a] if nums[a] > nums[b]
  end
end

p nums

