module Enumerable
  def my_each
    i = 0
    length.times do
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    length.times do
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    i = 0
    res_arr=[]
    length.times do
      res_arr << self[i] if yield(self[i]) == true
      i += 1
    end
    res_arr
  end

  def my_all?
    i = 0
    length.times do
      return false if yield(self[i]) == false
      i += 1
    end
    true
  end

  def my_none?
    i = 0
    length.times do
      return false if yield(self[i]) == true
      i += 1
    end
    true
  end

  def my_count
    i = 0
    c=0
    length.times do
      c+=1 if yield(self[i]) == true
      i += 1
    end
    c
  end

  def my_map
    i = 0
    res_Array=[]
    length.times do
      res_Array << yield(self[i]) if block_given?
      res_Array <<  proc.call(self[i])
      i += 1
    end
    res_Array
  end

  def my_inject start_value
    my_each{|element| start_value = yield(start_value,element)}
    start_value
  end
end
def multiply_els(arr)
  return arr.my_inject(1){|initial,num| initial*num}
end
testa=[3,6,4,1,9,7,8,2,3]
testb=[2,4,6,8,10]
testc=[2,3,4,8,1,3]
testd=[2,4,5]
my_proc = Proc.new {|i| i*2}
print testa.my_map(&my_proc)
print testa.my_map{|i| i*2}
print testa.my_each{|i| i*2}
