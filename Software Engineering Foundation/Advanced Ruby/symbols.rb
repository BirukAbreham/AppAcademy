str = "hello"
sym = :hello

# p str.object_id
# str[1] = "k"
# str2 = str
# p str.object_id
# p str2.object_id
# p sym.object_id

my_bootcamp = { :name=> "App Academy", :color=>"red", :locations=>["NY", "SF"]}
p my_bootcamp[:name]

# alternative version
my_bootcamp_colon = { name:"App Academy", color:"red", locations:["NY", "SF"] }
p my_bootcamp_colon