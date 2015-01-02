module Enumerable
  def my_each
    return self unless block_given?
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    return self unless block_given?
    for i in 0...length
      yield(self[i], i)
    end
  end

  def my_select
    return self unless block_given?
    new_array = []
    my_each { |i| new_array << i if yield(i)}
    new_array
  end

  def my_all?
    if block_given?
      my_each { |i| return false unless yield(i)}
    else
      my_each { |i| return false unless i}
    end
    true
  end

  def my_any?
    if block_given?
      my_each { |i| return true if yield(i)}
    else
      my_each { |i| return true if i}
    end
    false
  end

  def my_none?
    if block_given?
      my_each { |i| return true unless yield(i)}
    else
      my_each { |i| return false if i}
    end
    false
  end

  def my_count(num = nil)
    c= 0
    if block_given?
      my_each {|i| c += 1 if yield(i)}
    elsif num.nil?
      c = length
    else
      my_each {|i| c += 1 if i == num}
    end
    c
  end

  def my_map(code_block)
    array = []
    if code_block
      my_each do |i|
        new_array << code_block.call(i)
      end
      return new_array
    else
      return self
    end
  end


    puts [1,2,3].my_none? {|x| x > 0}
    puts [1,2,3].none? {|x| x > 0}
    puts [1,2,3].my_count(2)
    puts [1,2,3].count(2)
    puts [1,2,3].my_map {|x| x += 1}
    puts [1,2,3].map {|x| x += 1}

  end
