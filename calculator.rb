#all requires go on top
require 'pry'

def get_input
  puts "\nPlease enter an equation with space in between each input. Ex: 2 + 2"
  puts "You may also enter trig functions cos, sin and tan. Ex: cos(180) + sin(32)"
  puts "You may also type 'quit' to Quit"
  parse($stdin.gets.strip)
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

def verify_number(input)
  if (!input)
    puts "ERROR: One or more numbers was left blank! Please try again."
    get_input
  end

  number = Float(input) rescue false
  if (number)
    number = number.to_f
  elsif input.scan(/cos\((.*?)\)/) != []
    number = Math.cos(input.scan(/cos\((.*?)\)/)[0][0].to_f)
  elsif input.scan(/sin\((.*?)\)/) != []
    number = Math.sin(input.scan(/sin\((.*?)\)/)[0][0].to_f)
  elsif input.scan(/tan\((.*?)\)/) != []
    number = Math.tan(input.scan(/tan\((.*?)\)/)[0][0].to_f)
  else
    puts "ERROR: #{input} could not be read! Please try again."
    get_input
  end
end

def parse(input)
  if input.downcase == "quit"
    exit
  end

  input_array = input.split(" ")
  
  first_num = verify_number(input_array[0])
  second_num = verify_number(input_array[2])
  operation = verify_operator(input_array[1])

  if verify_operator(input_array[1])
    operation = input_array[1]
  else
    puts "ERROR: Operator could not be read"
    get_input
  end

  puts "The result of #{first_num} #{operation} #{second_num} is #{get_answer(first_num, operation, second_num).round(2)}"

end

puts "--- WELCOME TO THE RUBY CALCULATOR ---"
get_input




