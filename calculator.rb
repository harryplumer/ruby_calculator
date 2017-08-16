#all requires go on top
require 'pry'

def get_num
  num = Float(gets.strip) rescue false
  if (num)
    num = num.to_f
  else
    puts "Please Enter A Valid Number"  
    get_num()
  end
end

def get_operator
  operator = gets.strip
    if operator == "+" || operator == "-" || operator == "*" || operator == "/"
      operator
    elsif operator == "C" || operator == "CLEAR" || operator == "clear" || operator == "c"
      operator = "C"
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
first_num = nil

while true
  if (!first_num)
    puts "What is the first number?"
    first_num = get_num
  end
  puts "Enter the operator or enter 'C' to clear"
  operation = get_operator
  if (operation == "C")
    first_num = nil
    puts "Clearing..."
    next
  else
    puts "What is the second number?"
    second_num = get_num
    puts "Calculating..."
    answer = get_answer(first_num, operation, second_num)
    puts "The result of #{first_num.round(2)} #{operation} #{second_num.round(2)} is #{answer.round(2)}"
    first_num = answer
  end
end





