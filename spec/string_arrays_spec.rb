require 'spec_helper'

describe 'All Unique' do

    let(:simple_string) { 'abcde' }
    let(:simple_string_fail) { 'aabbccddee' }
    let(:numbers_are_chars_too) { '12345' }
    let(:spaces) { ' ' }
    let(:bad_case) { '' }
    let(:really_bad_case) { nil }

    describe '#is_unique?' do
        it 'should work with a unique string' do
            is_unique?(simple_string).should eq(true)
        end

        it 'should work with a non unique string' do
            is_unique?(simple_string_fail).should eq(false)
        end

        it 'should work with a numbers' do
            is_unique?(numbers_are_chars_too).should eq(true)
        end

        it 'should work with a [space]' do
            is_unique?(spaces).should eq(true)
        end

        it 'should work with an empty string' do
            is_unique?(bad_case).should eq(true)
        end

        it 'should work with a NIL' do
            is_unique?(really_bad_case).should eq(false)
        end
    end

    describe '#is_unique_in_place?' do
        it 'should work with a unique string' do
            is_unique_in_place?(simple_string).should eq(true)
        end

        it 'should work with a non unique string' do
            is_unique_in_place?(simple_string_fail).should eq(false)
        end

        it 'should work with a numbers' do
            is_unique_in_place?(numbers_are_chars_too).should eq(true)
        end

        it 'should work with a [space]' do
            is_unique_in_place?(spaces).should eq(true)
        end

        it 'should work with an empty string' do
            is_unique_in_place?(bad_case).should eq(true)
        end

        it 'should work with a NIL' do
            is_unique_in_place?(really_bad_case).should eq(false)
        end
    end

    describe '#is_unique_using_sets?' do
        it 'should work with a unique string' do
            is_unique_using_sets?(simple_string).should eq(true)
        end

        it 'should work with a non unique string' do
            is_unique_using_sets?(simple_string_fail).should eq(false)
        end

        it 'should work with a numbers' do
            is_unique_using_sets?(numbers_are_chars_too).should eq(true)
        end

        it 'should work with a [space]' do
            is_unique_using_sets?(spaces).should eq(true)
        end

        it 'should work with an empty string' do
            is_unique_using_sets?(bad_case).should eq(true)
        end

        it 'should work with a NIL' do
            is_unique_using_sets?(really_bad_case).should eq(false)
        end
    end
end

describe 'Permutations' do
    let(:simple_string) { 'abc' }
    let(:simple_string_permutations) { ['abc', 'acb', 'bac', 'bca', 'cab', 'cba'] }
    let(:simple_string_not_permutations) { ['zoo', 'tree', 'cable'] }

    describe '#is_permutation_set?' do
        it 'should work when there is a permuation' do
            simple_string_permutations.each do |test|
                is_permutation_set?(simple_string, test).should eq(true)
            end
        end

        it 'should work when there is not a permuation' do
            simple_string_not_permutations.each do |test|
                is_permutation_set?(simple_string, test).should eq(false)
            end
        end
    end

    describe '#is_permutation?' do
        it 'should work when there is a permuation' do
            simple_string_permutations.each do |test|
                is_permutation?(simple_string, test).should eq(true)
            end
        end

        it 'should work when there is not a permuation' do
            simple_string_not_permutations.each do |test|
                is_permutation?(simple_string, test).should eq(false)
            end
        end
    end
end

describe 'Reverse' do
    let(:simple_string) { 'abcde' }
    let(:simple_string_fail) { 'aabbccddee' }
    let(:numbers_are_chars_too) { '12345' }
    let(:spaces) { ' ' }
    let(:bad_case) { '' }
    let(:really_bad_case) { nil }
    let(:even_case) { '123456' }

    describe '#reverse_non_api' do
        it 'should work with a simple string' do
            simple_string.reverse.should eq(reverse_non_api(simple_string))
        end

        it 'should work with a longer string with duplicates' do
            simple_string_fail.reverse.should eq(reverse_non_api(simple_string_fail))
        end

        it 'should work with a string of numbers' do
            numbers_are_chars_too.reverse.should eq(reverse_non_api(numbers_are_chars_too))
        end

        it 'should work with a string of spaces' do
            spaces.reverse.should eq(reverse_non_api(spaces))
        end

        it 'should work with a blank string' do
            bad_case.reverse.should eq(reverse_non_api(bad_case))
        end

        it 'should work with a nil string' do
            nil.should eq(reverse_non_api(really_bad_case))
        end
    end

    describe '#reverse_in_place' do
        it 'should work with a simple string' do
            simple_string.reverse.should eq(reverse_in_place(simple_string))
        end

        it 'should work with a longer string with duplicates' do
            simple_string_fail.reverse.should eq(reverse_in_place(simple_string_fail))
        end

        it 'should work with a string of numbers' do
            numbers_are_chars_too.reverse.should eq(reverse_in_place(numbers_are_chars_too))
        end

        it 'should work with a string of spaces' do
            spaces.reverse.should eq(reverse_in_place(spaces))
        end

        it 'should work with a blank string' do
            bad_case.reverse.should eq(reverse_in_place(bad_case))
        end

        it 'should work with a nil string' do
            nil.should eq(reverse_in_place(really_bad_case))
        end
    end
end