
def binary_search(input, target)
  mid = (input.size / 2).floor

  return true  if input[mid] == target
  return false if input.size == 1

  if target < input[mid]
    input = input[0, mid]
  else
    input = input[mid, input.size]
  end

  binary_search(input, target)
end

input = [1, 2, 4, 7, 9, 12, 15]

p binary_search(input, 4)  # true
p binary_search(input, 20) # false
