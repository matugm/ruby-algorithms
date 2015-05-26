@cache = []

def fib(num = 150)
  return @cache[num] if @cache[num]
  return 1 if num == 1
  return 0 if num == 0

  @cache[num] = fib(num-1) + fib(num-2)
end

p fib

