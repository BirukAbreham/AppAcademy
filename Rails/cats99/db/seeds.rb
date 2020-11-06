# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kitty_one = Cat.create!({
  name: 'Luna',
  sex: 'F',
  birth_date: '2015/01/20',
  color: 'orange',
  description: 'A nice cat with sleepy head',
})

kitty_two = Cat.create!({
  name: 'Nala',
  sex: 'M',
  birth_date: '2014/01/26',
  color: 'green',
  description: 'A nice cat with granny character'
})

kitty_thr = Cat.create!({
  name: 'Zoe',
  sex: 'F',
  birth_date: '2017/05/14',
  color: 'red',
  description: 'A nice female cat',
})

kitty_fr = Cat.create!({
  name: 'Buddy',
  sex: 'M',
  birth_date: '2018/06/01',
  color: 'blue',
  description: 'A nice cat with playful character',
})

kitty_five = Cat.create!({
  name: 'Bella',
  sex: 'F',
  birth_date: '2019/03/04',
  color: 'yellow',
  description: 'A nice cat with playful character',
})
