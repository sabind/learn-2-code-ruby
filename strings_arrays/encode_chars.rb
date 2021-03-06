# The logic here is used all the time by web applications. There are certain 
# characters that cannot be placed in a URL. However sometimes it's required
# that they get sent as URL parameters. The process of replacing these characters
# in the URL is called URL Encoding. for this example we're going to replace the 
# characters we target with 

# simple encoding will walk the string and build a new string with the results
# it accepts the string as well as a map so we know what we want to replace as 
# well as what the intended replacement is.

def simple_encode(input, key_map)
  
  # NEVER trust input to be valid. Always double check it.
  if !input
    return nil
  end
  
  if !key_map
    return input
  end
  
  encoded_string = ''
  
  input.chars.each do |character|
    if key_map[character]
      encoded_string += key_map[character]
    else
      encoded_string += character
    end
  end
  
  encoded_string
end

# We can do this function in place. The thing to note is if we're replacing a 
# letter in a string in place by inserting more letters we're actually moving
# all the letters after the insertion over and that's an expensive CPU operation
# when the string gets very long. For example if we have to replace the first 
# letter in the string with two letters we have to move all of the letters in the 
# string over one to make room. Also notice the ! in the method name. This means
# we're modifying in place and the side_effects will change the input permanently

def in_place_encode!(input, key_map)
  
  # NEVER trust input to be valid. Always double check it.
  if !input
    return nil
  end
  
  if !key_map
    return input
  end
  
  # we can not use an 'iterator for this operation. Iterators like 'each' do not
  # work well with insertion and deletation. Since we're growing the array by 
  # inserting potentially longer sequences we'll create some straange behavior.
  # For that reason we have to use a simple for loop.
  i = 0
  while i < input.length  do
    if key_map[input[i]]
      # Save the length. We're going to be modifying stuff so we won't be able
      # to retrieve this one we modify the string
      key_map_length = key_map[input[i]].length
      
      input[i] = key_map[input[i]]
      
      # increment the index by length of the new value since we're inserting the
      # new characters and we don't want to encode the encoding.
      i += key_map_length
    else
      i +=1
    end
  end
  
  # note the lack of a return. We are modifying in place so the input variable
  # passed in will be updated already.
end
