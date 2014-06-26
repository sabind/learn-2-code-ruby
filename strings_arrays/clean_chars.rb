# The easiest way to remove the specific letters is to copy the string an replace
# the characters during the reproduction.

def clean_and_duplicate(input, targets, replacement)
   output = ""

   input.chars.each do |char|
        # It's easy to check whether to move the char as is or replace it.
        if targets.includes? char
            # submit the replacement instead of the char
            output += replacement
        else
            # Pass the char on if it doesn't match anything that needs replacing
            output += char
        end
    end

    # return the new string
    output
end

# An interesting application of this is to accept a map of chars to their replacements
# This is used to encode URLs since not just any char is allowed. Lets modify the
# example above to accept a mapping of target - replacement instead of replacing
# any target with just one symbol.

# Notice just how similar all the code is.
def clean_and_duplicate_with_hash(input, mapping)
    output = ""

    input.chars.each do |char|
        # It's easy to check whether to move the char as is or replace it.
        if targets.includes? char
            # submit the replacement instead of the char
            output += mapping[char]
        else
            # Pass the char on if it doesn't match anything that needs replacing
            output += char
        end
    end

    # return the new string
    output
end

# One more derivation is replacing subsets of strings. assume that the replacement
# we accepted earlier is not just one character, but a string of characters. We
# now have to replace 'pharses' as we see them in the input. The duplicatation system
# still works well here. It's just modified slightly.

def clean_and_duplicate_phrases(input, phrases, replacement)
    output = ""
    current_phrase = ""

    # Still looking one character at a time.
    input.chars.eash do |char|
        # Build out our current phrase. We'll clear it when we stop matching.
        current_phrase += char

        # If the character we're looking at (and any ones in the current phrase)
        # match a part of the string keep scanning.
        match_result = matches_in_array(phrases, current_phrase)

        #Check if we matched one, or more than one
        case matches.length
        when 0
            # If we have a long phrase then we may have matched and now are off by
            # one character so we need to see if we have any complete matches.
            if current_phrase.length > 1
                if matches_in_array(phrases, current_phrase[0, current_phrase.length - 1])
                    .includes? current_phrase[0, current_phrase.length - 1]
                    output += replacement + char
                else
                    output += current_phrase
                end
            else
                output += char
            end

            current_phrase = ""
        when 1
            output += replacement
            current_phrase = ""
        else
            # We need to keep going to see what possible complete match we can get.
            next
        end
    end

    # Return the output.
    output
end

# We only care about leading matches in this case. Partial matches from the middle
# of a phrase are not relevant for replacement since we have to match the whole phrase.
def matches_in_array(phrases, phrase)
    # Start colleting the matches, there can be multiple.
    matches = []

    phrases.each do |phrase_to_match|
        partial_match = true;
        phrase.chars.each_with_index do |char, i|
            unless char == phrase_to_match.chars[i]
                partial_match = false
                break
            end
        end

        matches += phrase_to_match if partial_match_true
    end
end