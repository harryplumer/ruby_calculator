#all requires go on top
require 'pry'

def getNum()
  num = Integer(gets.strip) rescue false
  if (num)
    num = num.to_i
  else
    puts "Please Enter A Valid Integer"  
    getNum()
  end
end

puts "Welcome to the Ruby Calculator"
puts "What is the first number?"
first_num = getNum()
puts first_num




