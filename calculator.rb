def run
  puts "Greetings from Robot Land! I am a talking calculator."
  puts "I will need a few things from you."
  operator = get_operator
  puts "Great! Now, what's the first number we're using?"
  n1 = get_integer
  if operator != "sqrt"
    puts "Now the second number!"
    n2 = get_integer
  else
    n2 = 1
  end
  answer = print_and_return_result(operator, n1, n2)
  check_continue(answer)
end

def print_and_return_result(operator, n1, n2)
  answer = calculate(operator, n1, n2)
  if operator != "sqrt"
    puts "#{n1} #{operator} #{n2} = #{answer}"
  else
    puts "The square root of #{n1} = #{answer}"
  end
  return answer
end

def check_continue(answer)
  yes_options = ["yes", "y", "yup", "ok", "totally"]
  loop do
    puts "Would you like to perform another operation on #{answer}?"
    print "> "
    continue = gets.chomp
    puts continue
    if !(yes_options.include? continue)
      break
    else
      answer = operate_on_answer(answer)
    end
  end
end

def operate_on_answer(answer)
  answer = float_or_int(answer)
  operator=get_operator
  puts "With what other number?"
  n1 = get_integer
  print_and_return_result(operator, answer, n1)
end

def get_operator
  puts "What operation are we performing?"
  operations = ["+","-", "/", "*", "%", "**", "sqrt"]
  operator = "Placeholder"
  while !(operations.include? operator)
    print "> "
    operator = gets.chomp.downcase
    case operator
    when "*", "multiply", "multiplication"
      operator = "*"
    when "+", "add", "addition"
      operator = "+"
    when "-", "subtract", "subtraction"
      operator = "-"
    when "/", "divide", "division"
      operator = "/"
    when "%", "modulo", "remainer"
      operator = "%"
    when "**", "expontent", "power", "^"
      operator = "**"
    when "sqrt", "square root", "root"
      operator = "sqrt"
    else
      puts "That's not a kind of maths I recognize. Try one of these: "
      puts "+, -, /, *, %, **, sqrt"
    end
  end
  return operator
end

def get_integer
  need_integer = true
  while (need_integer)
    print "> "
    user_num = gets.chomp.downcase
    if user_num == "0" || user_num.to_i != 0
      user_num = float_or_int(user_num)
      puts "Okay, so our number is #{user_num}."
      need_integer = false
    elsif user_num == ""
      puts "Did you mean 0? You'll have to actually type '0'."
    else
      puts "That's not a number I know. I'll need an integer to continue."
    end
  end
  return user_num
end

def float_or_int(number)
  puts "Should #{number} be a float or interger?"
  answer = gets.chomp
  case answer
  when "f", /float/
    return number.to_f
  when "i", /int/
    return number.to_i
  else
    puts "Not sure what you mean. I'll default to Interger."
    return number.to_i
  end
end

def calculate(f, a, b)
  case f
  when "+"
    answer = a + b
  when "-"
    answer = a - b
  when "*"
    answer = a * b
  when "/"
    if b == 0
      abort("No dividing by 0. Get out.")
    else
    answer = a.to_f / b
    end
  when "%"
    answer = a % b
  when "**"
    answer = a**b
  when "sqrt"
    answer = Math.sqrt(a)
  else
    abort("Something's gone terribly wrong!")
  end
  return answer
end

run
