def factorial(n)
  if n == 1
    return 1
  else
    return n * factorial(n - 1)
  end
end

# puts factorial(5)

def palindrome(string)
  if string.length == 1 || string.length == 0
    true
  else
    if string[0] == string[-1]
      palindrome(string[1..-2])
    else
      false
    end
  end
end

# puts palindrome("racecars")

def bottles_of_beer(n)
  if n.zero?
    puts "No more bottles of beer on the wall"
  else
    puts "#{n} bottles of beer on the wall"
    bottles_of_beer(n - 1)
  end
end

# bottles_of_beer(40)

def fibonacci(n)
  if (0..1).include? n
    n
  else
    (fibonacci(n - 1) + fibonacci(n - 2))
  end
end

# puts fibonacci(41)

def flatten(array, result = [])
  array.each do |element|
    if element.is_a?(Array)
      flatten(element, result)
    else
      result << element
    end
  end
  result
end

# p flatten([2, [23, 241], [2], [[12, [23, 23], 241, 1], 90]])

roman_mapping_1 = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

def roman(roman_mapping, num, result="")
  return result if num.zero?

  roman_mapping.each_key do |divisor|
    quotient, modulus = num.divmod(divisor)
    result << roman_mapping[divisor] * quotient
    return roman(roman_mapping, modulus, result) if quotient.positive?
  end
end

puts roman(roman_mapping_1, 2022)


roman_mapping_2 = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

def roman_to_int(roman_mapping, str, result = 0)
  return result if str.empty?
  roman_mapping.each_key do |roman|
    if str.start_with?(roman)
      result += roman_mapping[roman]
      str = str.slice(roman.length, str.length)
      return roman_to_int(roman_mapping, str, result)
    end
  end
end

puts roman_to_int(roman_mapping_2, "MMXXII")
