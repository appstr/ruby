require 'byebug'

# BEGIN_UPPER = 65
# END_UPPER = 90
#
# BEGIN_LOWER = 97
# END_LOWER = 122
#
# ROT_CONST = 13
#
# def rot13(secret_message)
#   lower_case_map = get_lowercase_map
#   upper_case_map = get_uppercase_map
#   new_message = []
#   secret_message.each do |word|
#     word = word.split("")
#     word_catch = []
#     word.each do |letter|
#       ascii_num = letter.ord
#       lower_or_upper = get_lower_or_upper(ascii_num)
#       if lower_or_upper == "U"
#         # iterate through uppercase hash. if ascii_num + 13 <= END_UPPER
#         while ascii_num + ROT_CONST > END_UPPER
#           ascii_num -= 26
#         end
#         ascii_num += ROT_CONST
#         word_catch << ascii_num.chr
#       elsif lower_or_upper == "L"
#         # iterate through lowercase hash. if ascii_num + 13 <= END_LOWER
#         while ascii_num + ROT_CONST > END_LOWER
#           ascii_num -= 26
#         end
#         ascii_num += ROT_CONST
#         word_catch << ascii_num.chr
#       else
#         word_catch << letter
#       end
#     end
#     new_message << word_catch.join("")
#   end
#   new_message
# end
#
# def get_lower_or_upper(ascii_num)
#   if (BEGIN_UPPER..END_UPPER).include? ascii_num
#     r = "U"
#   elsif (BEGIN_LOWER..END_LOWER).include? ascii_num
#     r = "L"
#   else
#     r = "SC"
#   end
# end
#
# def get_lowercase_map
#   l = {}
#   (BEGIN_UPPER..END_UPPER).each do |num|
#     l[num] = num.chr
#   end
#   l
# end
#
# def get_uppercase_map
#   u = {}
#   (BEGIN_LOWER..END_LOWER).each do |num|
#     u[num] = num.chr
#   end
#   u
# end




# ROT = 13

# def rot13(secret_messages)
#     lowercase = ("a".."z").to_a
#     uppercase = ("A".."Z").to_a
#     new_secret = []
#     secret_messages.each do |word_str|
#       strs = word_str.split(" ")
#       new_message = []
#       strs.each do |str|
#         new_str = ""
#         str.each_char do |char|
#           if lowercase.include? char
#             alphabet = lowercase
#             new_str += decypher_char(char, alphabet)
#           elsif uppercase.include? char
#             alphabet = uppercase
#             new_str += decypher_char(char, alphabet)
#           else
#             new_str += char
#           end
#         end
#         new_message << new_str
#       end
#       new_secret << new_message.join(" ")
#     end
#     new_secret
# end
#
# def decypher_char(char, alphabet)
#   if alphabet.index(char) + ROT <= 25
#     return alphabet[alphabet.index(char) + ROT]
#   else
#     diff = 25 - alphabet.index(char)
#     rot = ROT - diff
#     return alphabet[rot - 1]
#   end
# end

# print rot13(["qrygn", "zrrg ng pubpbyngr pbeare", "gra zra", "gjb onpxhc grnzf", "zvqavtug rkgenpgvba"])
# print rot13(%w(Why did the chicken cross the road?))
