
def qsort(list)
  return list if list.size <= 1

  first = list.sample
  less_than    = []
  greater_than = []

  list.each do |n|
    n < first ? (less_than << n) : (greater_than << n)
  end

  qsort(less_than) + qsort(greater_than)
end

p qsort [3, 7, 2, 1, 8, 12]
