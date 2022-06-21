arr = ["b", "a"]
arr = arr.product(Array(1..3))
arr.first.delete(arr.first.last)

# Returns 1, arr value now [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3']]

arr = ["b", "a"]
arr = arr.product([Array(1..3)])
arr.first.delete(arr.first.last)

# Returns [1, 2, 3], arr value now [["b"], ["a", [1, 2, 3]]] 