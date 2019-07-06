class Array
    def my_each
      count = 0
      while count < self.length
        yield(self[count])
        count += 1
      end
    end
  
    def my_map
      result = []
      self.my_each do |elem|
        result << yield(elem)
      end
      result
    end
  
    def my_select
      result = []
      self.my_each do |elem|
        condition = yield(elem)
        if condition
            result << elem
        end
      result
    end
  end
  
  def my_each_test
    arr1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    arr1.my_each do |elem|
      p elem
    end
  end
  
  def my_select_test
    arr1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    arr2 = arr1.my_select do |x|
      (x % 3).zero?
    end
    p arr2
  end
  
  def my_map_test
    arr1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    arr2 = arr1.my_map do |x|
      x * 2
    end
    p arr2
  end

arr1 = [1,2,3]
arr1.each do ||

end