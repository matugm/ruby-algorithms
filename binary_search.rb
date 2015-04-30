
def binary_search(input, find)
  mid = (input.size / 2).floor

  return true  if input[mid] == find
  return false if input.size == 1

  if find < input[mid]
    input = input[0, mid]
  else
    input = input[mid, input.size]
  end

  binary_search(input, find)
end

input = [1, 2, 4, 7, 9, 12]
find  = 4

p binary_search(input, find)

