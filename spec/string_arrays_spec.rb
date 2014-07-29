require 'spec_helper'
describe 'Strings and Arrays: ' do
  let(:simple_string) { 'abcde' }
  let(:simple_string_fail) { 'aabbccddee' }
  let(:numbers_are_chars_too) { '12345' }
  let(:spaces) { ' ' }
  let(:bad_case) { '' }
  let(:really_bad_case) { nil }

  let(:simple_string) { 'abc' }
  let(:simple_string_permutations) { ['abc', 'acb', 'bac', 'bca', 'cab', 'cba'] }
  let(:simple_string_not_permutations) { ['zoo', 'tree', 'cable'] }

  describe 'All Unique' do
    describe '#is_unique?' do
      it 'should work with a unique string' do
        expect(is_unique?(simple_string)).to eq(true)
      end

      it 'should work with a non unique string' do
        expect(is_unique?(simple_string_fail)).to eq(false)
      end

      it 'should work with a numbers' do
        expect(is_unique?(numbers_are_chars_too)).to eq(true)
      end

      it 'should work with a [space]' do
        expect(is_unique?(spaces)).to eq(true)
      end

      it 'should work with an empty string' do
        expect(is_unique?(bad_case)).to eq(true)
      end

      it 'should work with a NIL' do
        expect(is_unique?(really_bad_case)).to eq(false)
      end
    end

    describe '#is_unique_in_place?' do
      it 'should work with a unique string' do
        expect(is_unique_in_place?(simple_string)).to eq(true)
      end

      it 'should work with a non unique string' do
        expect(is_unique_in_place?(simple_string_fail)).to eq(false)
      end

      it 'should work with a numbers' do
        expect(is_unique_in_place?(numbers_are_chars_too)).to eq(true)
      end

      it 'should work with a [space]' do
        expect(is_unique_in_place?(spaces)).to eq(true)
      end

      it 'should work with an empty string' do
        expect(is_unique_in_place?(bad_case)).to eq(true)
      end

      it 'should work with a NIL' do
        expect(is_unique_in_place?(really_bad_case)).to eq(false)
      end
    end

    describe '#is_unique_using_sets?' do
      it 'should work with a unique string' do
        expect(is_unique_using_sets?(simple_string)).to eq(true)
      end

      it 'should work with a non unique string' do
        expect(is_unique_using_sets?(simple_string_fail)).to eq(false)
      end

      it 'should work with a numbers' do
        expect(is_unique_using_sets?(numbers_are_chars_too)).to eq(true)
      end

      it 'should work with a [space]' do
        expect(is_unique_using_sets?(spaces)).to eq(true)
      end

      it 'should work with an empty string' do
        expect(is_unique_using_sets?(bad_case)).to eq(true)
      end

      it 'should work with a NIL' do
        expect(is_unique_using_sets?(really_bad_case)).to eq(false)
      end
    end
  end

  describe 'Permutations' do
    describe '#is_permutation_set?' do
      it 'should work when there is a permuation' do
        simple_string_permutations.each do |test|
          expect(is_permutation_set?(simple_string, test)).to eq(true)
        end
      end

      it 'should work when there is not a permuation' do
        simple_string_not_permutations.each do |test|
          expect(is_permutation_set?(simple_string, test)).to eq(false)
        end
      end
    end

    describe '#is_permutation?' do
      it 'should work when there is a permuation' do
        simple_string_permutations.each do |test|
          expect(is_permutation?(simple_string, test)).to eq(true)
        end
      end

      it 'should work when there is not a permuation' do
        simple_string_not_permutations.each do |test|
          expect(is_permutation?(simple_string, test)).to eq(false)
        end
      end
    end
  end

  describe 'Reverse' do
    describe '#reverse_non_api' do
      it 'should work with a simple string' do
        expect(simple_string.reverse).to eq(reverse_non_api(simple_string))
      end

      it 'should work with a longer string with duplicates' do
        expect(simple_string_fail.reverse).to eq(reverse_non_api(simple_string_fail))
      end

      it 'should work with a string of numbers' do
        expect(numbers_are_chars_too.reverse).to eq(reverse_non_api(numbers_are_chars_too))
      end

      it 'should work with a string of spaces' do
        expect(spaces.reverse).to eq(reverse_non_api(spaces))
      end

      it 'should work with a blank string' do
        expect(bad_case.reverse).to eq(reverse_non_api(bad_case))
      end

      it 'should work with a nil string' do
        expect(nil).to eq(reverse_non_api(really_bad_case))
      end
    end

    describe '#reverse_in_place' do
      it 'should work with a simple string' do
        expect(simple_string.reverse).to eq(reverse_in_place(simple_string))
      end

      it 'should work with a longer string with duplicates' do
        expect(simple_string_fail.reverse).to eq(reverse_in_place(simple_string_fail))
      end

      it 'should work with a string of numbers' do
        expect(numbers_are_chars_too.reverse).to eq(reverse_in_place(numbers_are_chars_too))
      end

      it 'should work with a string of spaces' do
        expect(spaces.reverse).to eq(reverse_in_place(spaces))
      end

      it 'should work with a blank string' do
        expect(bad_case.reverse).to eq(reverse_in_place(bad_case))
      end

      it 'should work with a nil string' do
        expect(nil).to eq(reverse_in_place(really_bad_case))
      end
    end
  end
end
