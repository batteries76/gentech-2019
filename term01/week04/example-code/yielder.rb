
class Array
    def my_each()
        # print(self)
        # puts
        counter = 0
        while(counter < self.length)
            yield(self[counter])
            counter += 1
        end
    end
end
arr1 = [3, 5, 9, 6, 0, 2]
arr1.my_each() do |item|
    puts(item)
    # puts
end
# arr1.my_each
arr2 = ["fish", "cat", "dog"]
arr2.my_each() do |animal|
    puts(animal)
end

def first_and_last(arr)
    # puts("Started first_and_last")   
    first = arr.first
    last = arr.last
    yield(first, last)
end

first_and_last(arr1) do |first| 
    # puts(first)
    f_l_arr = [first, 100]
    # print f_l_arr
    # puts
end

first_and_last(arr1) do |x, y| 
    # puts(x, y)
    f_l_hash = {
        first: x, 
        last: y
    }
    # print f_l_hash
    # puts
end

first_and_last(arr1)
# arr1 = Array.new(3,4,5)

# def first_and_last_arr(arr)
#     first = arr.first
#     last = arr.last
#     return [first, last]
# end

# def first_and_last_hash(arr)
#     first = arr.first
#     last = arr.last
#     return {
#         first: first, 
#         last: last
#     }
# end

# f_l_res_arr = first_and_last_arr(arr)
# print f_l_res_arr
# puts

# f_l_res_hash = first_and_last_hash(arr)
# print f_l_res_hash
# puts

