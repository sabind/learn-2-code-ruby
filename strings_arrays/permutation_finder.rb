# NOTICE: We have to require 'set' since it's not included for us generally.
require 'set'

# Permutation (aka Anagram for words): rearranging the letters of a word or
# phrase to produce a new word or phrase

simple_string = 'abc'
simple_string_permutations = ['abc', 'acb', 'bac', 'bca', 'cab', 'cba']
simple_string_not_permutations = ['zoo', 'tree', 'cable']


# Knowledge of Sets is really important. However there are ways to make sure
# we have a permutation without using external data structures.

# Using sets this is an easy problem
def is_permutation_set?(input, test)
    set_input = Set.new input.chars.to_a
    set_test = Set.new test.chars.to_a
    input.length == test.length && set_input.subset?(set_test)
end

# Not using sets requires us to be more clever about what a permutation really is
# First it must match in length
# Second all the characters must exist (in otherwords the intersect must match exactly)
def is_permutation?(input, test)
    if test.length != input.length
        false
    else
        result = true
        input.each_char do |char|
            unless test.chars.include? char
                result = false
                # we break from the execution in order to save CPU time. After
                # the first failure there is no reason to keep looking for more.
                break
            end
        end
        result
    end
end

puts 'Testing with is_permuation_set?'
puts 'All these should be true'
simple_string_permutations.each do |test|
    puts is_permutation_set?(simple_string, test)
end

puts 'All these should be false'
simple_string_not_permutations.each do |test|
    puts is_permutation_set?(simple_string, test)
end

puts ''

puts 'Testing with is_permuation?'
puts 'All these should be true'
simple_string_permutations.each do |test|
    puts is_permutation?(simple_string, test)
end

puts 'All these should be false'
simple_string_not_permutations.each do |test|
    puts is_permutation?(simple_string, test)
end