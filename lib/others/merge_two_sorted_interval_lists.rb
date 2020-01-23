# Tags:
# Company: Facebook, Cisco
# Given A and B two sorted interval lists, A has no overlap inside A and B has no overlap inside B.
# Write the function to merge two sorted interval lists, output the result with no overlap. Ask for a very efficient solution.

# A naive method can combine the two list, and sort and apply merge interval in the leetcode, but is not efficient enough.  O(nlog(n))

# For example,
# A: [1,5], [10,14], [16,18]
# B: [2,6], [8,10], [11,20]

# output [1,6], [8, 20]

# 解题思路: 选取下一个interval的时候, 采用跟merge two sorted array类似的思路, 只是比较的是start
# 然后intervals merge的处理采用跟merge intervals类似的方法
def merge_two_sorted_interval_lists(list1, list2)
  results = []

  index1 = 0
  index2 = 0

  if list1.first[0] < list2.first[0]
    results.push list1.first
    index1 = 1
  else
    results.push list2.first
    index2 = 1
  end

  while index1 < list1.size || index2 < list2.size
    interval1 = list1[index1]
    interval2 = list2[index2]
    prev = results.last

    if index2 == list2.size || (interval1 && interval2 && interval1[0] < interval2[0])
      # merge next list1 interval
      if prev[1] < interval1[0]
        results.push interval1
      else
        prev[1] = [prev[1], interval1[1]].max
      end
      index1 += 1
    else
      # merge next list2 interval
      if prev[1] < interval2[0]
        results.push interval2
      else
        prev[1] = [prev[1], interval2[1]].max
      end
      index2 += 1
    end
  end

  results
end

list1 = [[1, 5], [10, 14], [16, 18]]
list2 = [[2, 6], [8, 10], [11, 20]]

pp merge_two_sorted_interval_lists(list1, list2) # [1,6], [8, 20]
