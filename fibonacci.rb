# Recursive solution

@cache = []

def fib(num = 150)
  return @cache[num] if @cache[num]
  return 1 if num == 1
  return 0 if num == 0

  @cache[num] = fib(num-1) + fib(num-2)
end

p fib

# Iterative solution

def fib2(num = 20)
  (0..num).each_with_object([]) do |i, memo|
    memo[i] = i < 2 ? i : memo[i-1] + memo[i-2]
  end
end

p fib2
