
def selection_sort(input)
  input.each_with_index do |_, i|
    min = i

    (i...input.size).each do |k|
      min = k if input[k] < input[min]
    end

    input[min], input[i] = input[i], input[min]
  end
end

p selection_sort [1,9,4,7,3,2,37,21]
