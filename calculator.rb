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

def get_answer(first_num, operation, second_num)
  case operation
    when "+"
      answer = first_num + second_num
    when "-"
      answer = first_num - second_num
    when "*"
      answer = first_num * second_num
    when "/"
      answer = first_num / second_num
  end
end

puts "Welcome to the Ruby Calculator"
puts "What is the first number?"
first_num = get_num
puts "What is the operator?"
operation = get_operator
puts "What is the second number?"
second_num = get_num
puts "Calculating..."
puts "The result of #{first_num} #{operation} #{second_num} is #{get_answer(first_num, operation, second_num)}"






