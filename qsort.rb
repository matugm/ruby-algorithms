
def qsort(list)
  return [] if list.empty?
  return list.first if list.size == 1

  first = list.shift
  less_than    = []
  greater_than = []

  list.each do |n|
    n < first ? (less_than << n) : (greater_than << n)
  end

  [qsort(less_than), first, qsort(greater_than)].compact.flatten
end

p qsort [3, 7, 2, 1, 8, 12]

