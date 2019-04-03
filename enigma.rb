def code_1(str)
  hash_map = {
    A: "Z",
    B: "Y",
    C: "X",
    D: "W",
    E: "V",
    F: "U",
    G: "T",
    H: "S",
    I: "R",
    J: "Q",
    K: "P",
    L: "O",
    M: "N",
    N: "M",
    O: "L",
    P: "K",
    Q: "J",
    R: "I",
    S: "H",
    T: "G",
    U: "F",
    V: "E",
    W: "D",
    X: "C",
    Y: "B",
    Z: "A",
  }
  new_str = []
  str_split = str.split("")
  str_split.each do |letter|
    new_str << hash_map[letter.to_sym]
  end
  puts new_str.join("")
end

def code_2(str)
  str_split = str.split("")
  new_word = []
  counter = 1
  str_split.each do |letter|
    new_word << letter if counter == 3
    counter += 1 if letter =~ /[A-Za-z]/
    counter = 1 if counter > 3
  end
  puts new_word.join("")
end

def code_3(ints)
  hash_map = {
    A: "11",
    B: "12",
    C: "13",
    D: "14",
    E: "15",
    F: "16",
    G: "17",
    H: "18",
    I: "19",
    J: "20",
    K: "21",
    L: "22",
    M: "23",
    N: "24",
    O: "25",
    P: "26",
    Q: "1",
    R: "2",
    S: "3",
    T: "4",
    U: "5",
    V: "6",
    W: "7",
    X: "8",
    Y: "9",
    Z: "10"
  }
  new_word = []
  split_ints = ints.split(" ")
  split_ints.each do |i|
    new_word << hash_map.key(i).to_s
  end
  puts new_word.join("")
end

def enigma(ints)
  hash_map = {
    A: "13",
    B: "12",
    C: "14",
    D: "15",
    E: "11",
    F: "10",
    G: "16",
    H: "17",
    I: "9",
    J: "8",
    K: "18",
    L: "19",
    M: "7",
    N: "6",
    O: "20",
    P: "21",
    Q: "5",
    R: "4",
    S: "22",
    T: "23",
    U: "3",
    V: "2",
    W: "24"
  }

  new_word = []
  split_ints = ints.split(" ")
  split_ints.each do |i|
    new_word << hash_map.key(i).to_s
  end
  puts new_word.join("")
end

# code_1("G	S	V	 	X	V	M	G	I	Z	O
# R	M	G	V	O	O	R	T	V	M	X	V	 	Z	T	V	M	X	B
# D	Z	H	 	X	I	V	Z	G	V	W	 	R	M
# +	=	$	&	 	D	S	V	M
# K	I	V	H	R	W	V	M	G	 	G	I	F	N	Z	M
# H	R	T	M	V	W	 	G	S	V
# M	Z	G	R	L	M	Z	O 	H	V	X	F	I	R	G	B	 	Z	X	G")

# code_2("WIGSAEPTNENECVRZNALTL QIDXBOKJNTJORUVSFALON PYIRTS GFCAIOYUNNDSHLIWEDNKEQURCBEMHD ROTFTHSIE APFETAOPTHLHVJEXER CJOAIF XCMGKOEMDFZEPGRBAN GHAFIMWEERURDKINYCCCALHN ZOIQUNAVTORETLLUNLEWISKGIBEAGNSPCITE TAGBRAYMTVWHQIEPFRGWIPVNBZG.")

# code_3("
# 4	18 15	13	19	11	19	3	 	22	25	13	11	4	15	14
# 19	24	22	11	24	17	22	15	9, 6	11.")

# enigma("15	3	4	9	6	16	 	24	20	4	19	15	 	24	13	4
# 23	24	20,	 	23	17	11	 	16	11	4	7	13	6	22
# 3	22	11	15	 	13	 	14	9	21	17	11	4
# 7	13	14	17	9	6	11	 	14	13	19	19	11	15
# 23	17	11	 	11	6	9	16	7	13.	 	9	23
# 14	20	3	19	15	 	22	11	6	15	 	13	6	15
# 4	11	14	11	9	2	11	 	7	11	22	22	13	16	11	22
# 5	3	9	14	18	19	1	 	13	6	15
# 22	11	14	4	11	23	19	1")
