def quick_sort(list)
  return [] if list.empty?

  groups = list.group_by { |n| n <=> list.first }

  less_than    = groups[-1] || []
  first        = groups[0]  || []
  greater_than = groups[1]  || []

  quick_sort(less_than) + first + quick_sort(greater_than)
end
