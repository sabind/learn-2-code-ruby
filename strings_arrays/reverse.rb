#test strings
simple_string = 'abcde'
simple_string_fail = 'aabbccddee'
numbers_are_chars_too = '12345'
spaces = ' '
bad_case = ''
really_bad_case = nil
even_case = '123456'

# Reversing a string is easy. Use the String API and call .reverse()
def reverse(input)
    # In ruby you can add conditionals at the end of a line. If the conditional
    # passes the line is run. Otherwise it returns nil. You can use this in assignemnt
    # conditions as well like 'a = 1 if true'. And it it's false remeber that the
    # left hand value will be set to nil.

    input.reverse unless input.nil?
end

# So thats generally cheating lets work something else out that does it without
# using system functions.
def reverse_non_api(input)
    if input
        # an easy non-api way to reverse a string is to rebuild it backwards
        output = ''
        input.each_char do |char|
            output.prepend char
        end
        output
    end
end

# Sometimes we don't want to use any extra memory. Just like before lets do
# this all in place.
def reverse_in_place(input)
    if input && !input.empty?
        # this is important to making sure we reverse correctly.
        even_length = input.length%2 == 0
        # we're going to use the middle as a mirror and swap across it. This is
        # where knowing if the length is even or odd becomes important

        # NOTICE: The middle in an even string points to the right side of a swap
        # between the two middle values. Try removing this TERNARY operator and
        # you'll se the swap happens from the left side and the right, so the
        # values are returned to their orignal positions.
        middle = even_length ? input.length/2 - 1 : input.length/2
        for index in 0..middle
            swap!(input, index, input.length-1-index)
        end
    end
    input
end

# NOTICE: Look at the '!' in the function name. You may have noticed the '?'
# earlier and never batted an eye. Howeve the '!' is a little alarming. What this
# notation means (coding convention) is that we are going to modify the input.
# This is a DESTRUCTIVE operation that will result in a permament change.
def swap!(input, index1, index2)
    #store one value in a temp
    c = input[index1]
    #overwrite in location we saved
    input[index1] = input[index2]
    #replace the second location with the saved value
    input[index2] = c
end

# NOTICE: This function doesn't modify the array. However it does have to return
# it and it wastes precious resources. Make careful decisions when using functions
# like this.
def swap(input, index1, index2)
    output = input.clone
    c = output[index1]
    #overwrite in location we saved
    output[index1] = output[index2]
    #replace the second location with the saved value
    output[index2] = c
    output
end

# Lets print out some tests
puts "Testing with reverse"
puts "Testing '#{simple_string}': #{reverse(simple_string)}"
puts "Testing '#{simple_string_fail}': #{reverse(simple_string_fail)}"
puts "Testing '#{numbers_are_chars_too}': #{reverse(numbers_are_chars_too)}"
puts "Testing '#{spaces}': #{reverse(spaces)}"
puts "Testing '#{bad_case}': #{reverse(bad_case)}"
puts "Testing '#{really_bad_case}': #{reverse(really_bad_case)}"
puts "Testing '#{really_bad_case}': #{reverse(even_case.clone)}"

puts ""

puts "Testing with reverse_non_api"
puts "Testing '#{simple_string}': #{reverse_non_api(simple_string)}"
puts "Testing '#{simple_string_fail}': #{reverse_non_api(simple_string_fail)}"
puts "Testing '#{numbers_are_chars_too}': #{reverse_non_api(numbers_are_chars_too)}"
puts "Testing '#{spaces}': #{reverse_non_api(spaces)}"
puts "Testing '#{bad_case}': #{reverse_non_api(bad_case)}"
puts "Testing '#{really_bad_case}': #{reverse_non_api(really_bad_case)}"
puts "Testing '#{really_bad_case}': #{reverse_non_api(even_case)}"

puts ""

# NOTICE: We need to clone the strings. Otherwise the reverse in place will mutate our test data permanently.
puts "Testing with reverse_in_place"
puts "Testing '#{simple_string}': #{reverse_in_place(simple_string.clone)}"
puts "Testing '#{simple_string_fail}': #{reverse_in_place(simple_string_fail.clone)}"
puts "Testing '#{numbers_are_chars_too}': #{reverse_in_place(numbers_are_chars_too.clone)}"
puts "Testing '#{spaces}': #{reverse_in_place(spaces.clone)}"
puts "Testing '#{bad_case}': #{reverse_in_place(bad_case.clone)}"
puts "Testing '#{really_bad_case}': #{reverse_in_place(really_bad_case)}"
puts "Testing '#{really_bad_case}': #{reverse_in_place(even_case.clone)}"