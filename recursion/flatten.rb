def flatten(arr)
  return [arr] if !arr.is_a?(Array)
  flattened = []
  arr.each do |e|
    flattened += flatten(e)
  end
  flattened
end


# p flatten([[1,2,3], [[7,7,7],[[["so guys we did it"]]]], [4,5,6], [7,8,9]])
