#all requires go on top
require 'pry'

def get_input
  puts "Please enter an equation with space in between all inputs (eg. 2 + 2) or type 'quit' to Quit"
  solve($stdin.gets.strip)
  get_input
end

def verify_operator(operator)
  if operator == "+" || operator == "-" || operator == "*" || operator == "/"
    operator
  else
    false
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
      if second_num == 0
        puts "Dividing by 0 is not permitted"
        get_input
      else
        answer = first_num / second_num
      end
  end
end

def solve(input)
  if input.downcase == "quit"
    exit
  end

  input_array = input.split(" ")

  first_num = Float(input_array[0]) rescue false
  if (first_num)
    first_num = input_array[0].to_f
  else  
    puts "ERROR: First number could not be read"
    get_input
  end

  second_num = Float(input_array[2]) rescue false
  if (second_num)
      second_num = input_array[2].to_f
  else  
      puts "ERROR: Second number could not be read"
      get_input
  end

  if verify_operator(input_array[1])
    operation = input_array[1]
  else
    puts "ERROR: Operator could not be read"
    get_input
  end

  puts "The result of #{input} is #{get_answer(first_num, operation, second_num).round(2)}"  
end

puts "Welcome to the Ruby Calculator"
get_input




