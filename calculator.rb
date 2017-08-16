#all requires go on top
require 'pry'

def get_num
  num = Integer(gets.strip) rescue false
  if (num)
    num = num.to_i
  else
    puts "Please Enter A Valid Integer"  
    get_num()
  end
end

def get_operator
  operator = gets.strip
    if operator == "+" || operator == "-" || operator == "*" || operator == "/"
      operator
    else
      puts "\"#{operator}\" is not a valid operator. Only the \"+, -, *, /\" operators are supported. Please enter a valid operator below"
      get_operator
  end
end

puts "Welcome to the Ruby Calculator"
puts "What is the first number?"
first_num = get_num
puts "What is the operator?"
operation = get_operator
puts "What is the second number?"
second_num = get_num
puts "The equation is #{first_num} #{operation} #{second_num}"






