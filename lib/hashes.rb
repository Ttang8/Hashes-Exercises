# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  hsh = Hash.new
  str.split.each do |word|
    hsh[word] = word.length
  end
  hsh
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  hash.sort_by { |keys, values| values }.last[0]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each do |month, inventory|
    older[month] = inventory
  end
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  hsh = Hash.new(0)

  word.each_char { |ch| hsh[ch] += 1 }

  hsh
end


# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  hsh = Hash.new(0)
  arr.each do |el|
    hsh[el] += 1
  end
  hsh.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  hsh = { even: 0, odd: 0 }
  numbers.each do |int|
    hsh[:even] += 1 if int.even?
    hsh[:odd] += 1 if int.odd?
  end
  hsh
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  sorted = string.chars.sort
  hsh = Hash.new(0)
  vowels = %w(a e i o u)
  sorted.each do |ch|
    if vowels.include?(ch)
      hsh[ch] += 1
    end
  end

  hsh.sort_by { |vowel, num| num }.last[0]
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  names = []
  students.each { |name, month| names << name if month > 6 }
  names.combination(2).to_a
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  hsh = Hash.new(0)

  specimens.each { |ani| hsh[ani] += 1 }

  number_of_species = hsh.length
  smallest_population_size = hsh.min.last
  largest_population_size = hsh.max.last

  (number_of_species ** 2) * (smallest_population_size / largest_population_size)

end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  ncount = character_count(normal_sign)
  vcount = character_count(vandalized_sign)
  vcount.each do |ch, count|
    return false if vcount[ch] > ncount[ch]
  end
  true
end

def character_count(str)
  no_punc = str.downcase.delete(",.:;?! ")
  hsh = Hash.new(0)

  no_punc.each_char do |ch|
    hsh[ch] += 1
  end

  hsh
end
