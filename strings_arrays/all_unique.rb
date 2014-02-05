require 'set'

#test strings
simple_string = 'abcde'
simple_string_fail = 'aabbccddee'
numbers_are_chars_too = '12345'
spaces = ' '
bad_case = ''
really_bad_case = nil


# Ruby has a few convenience methods that we can try to use (only for ruby 1.9.3)
# String.chars will give us an enum
# Enum.to_a will give us an array
# Array.uniq will return an array of the unique occurances
# Knowing this lets try and build some stuff

def is_unique?(input)
    if input.nil?
        false
    else
        all_chars = input.chars.to_a #convert the enum to array
        unique_chars = all_chars.uniq

        # if the length of the unique chars == length of string
        # there MUST NOT be dupes
        unique_chars.count == input.length
    end
end

# The function we used creates a lot of extra arrays.
# What if we had a memory issue? Can we re-write the algorithm
# so that it doesn't copy any information but rather works in place?

def is_unique_in_place?(input)
    if input.nil?
        false
    else
        dupe = false
        input.chars.each_with_index do |char, index|
            input[index+1..input.length-1].each_char do |char2|
                dupe = true if char == char2
            end
        end
        !dupe
    end
end

# Finally there is a away to code this even if we didn't have such nice functions
# given to us by Ruby (in case we're doing this in another programming language.
# We can use something called a 'SET'. A set is a special collection where you
# are not allowed to have duplicate entrys. During insertion the collection
# will automatically manage the entrys. This is much more powerful for large sets
# or computations. Doing the processing at the beginning can really speed up an
# algorithm

# NOTICE: In order to use Sets we had to "require 'set'" at the top of the file.
# Ruby offers many nice libraries, but only the core things are brought in by
# default.

def is_unique_using_sets?(input)
    # In ruby nil also evaluates to false. Notice how we've flipped the if/else
    # here. Reading about booleans in Ruby is important. There are many caviats.
    if input
        input_as_set = Set.new
        input.each_char do |char|
            input_as_set.add char
        end
        input_as_set.count == input.length
    else
        false
    end
end

# Lets print out some tests
puts "Testing with is_unique?"
puts "Testing '#{simple_string}': #{is_unique?(simple_string)}"
puts "Testing '#{simple_string_fail}': #{is_unique?(simple_string_fail)}"
puts "Testing '#{numbers_are_chars_too}': #{is_unique?(numbers_are_chars_too)}"
puts "Testing '#{spaces}': #{is_unique?(spaces)}"
puts "Testing '#{bad_case}': #{is_unique?(bad_case)}"
puts "Testing '#{really_bad_case}': #{is_unique?(really_bad_case)}"

puts ""

puts "Testing with is_unique_in_place?"
puts "Testing '#{simple_string}': #{is_unique_in_place?(simple_string)}"
puts "Testing '#{simple_string_fail}': #{is_unique_in_place?(simple_string_fail)}"
puts "Testing '#{numbers_are_chars_too}': #{is_unique_in_place?(numbers_are_chars_too)}"
puts "Testing '#{spaces}': #{is_unique_in_place?(spaces)}"
puts "Testing '#{bad_case}': #{is_unique_in_place?(bad_case)}"
puts "Testing '#{really_bad_case}': #{is_unique_in_place?(really_bad_case)}"

puts ""

puts "Testing with is_unique_using_sets?"
puts "Testing '#{simple_string}': #{is_unique_using_sets?(simple_string)}"
puts "Testing '#{simple_string_fail}': #{is_unique_using_sets?(simple_string_fail)}"
puts "Testing '#{numbers_are_chars_too}': #{is_unique_using_sets?(numbers_are_chars_too)}"
puts "Testing '#{spaces}': #{is_unique_using_sets?(spaces)}"
puts "Testing '#{bad_case}': #{is_unique_using_sets?(bad_case)}"
puts "Testing '#{really_bad_case}': #{is_unique_using_sets?(really_bad_case)}"