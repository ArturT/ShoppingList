user = User.find(ENV['USER_ID'] || User.last.try(:id) || 0)

if user.nil?
  puts "Please create user first"
else
  # Create lists for user
  ['My first list', 'My second list'].each do |list_name|
    list = List.new({
      user: user,
      name: list_name
    })
    list.save if list.valid?
  end

  # Create items
  item_names = ['Egg', 'Apple', 'Bread', 'Orange', 'Banana', 'Sugar', 'Salt', 'Pork', 'Chicken']
  item_names.each do |item_name|
    item = Item.new({name: item_name})
    item.save if item.valid?
  end

  # Assign items to user's lists
  Item.all.each do |item|
    list_item = ListItem.new({
      list: user.lists.sample,
      item: item,
      bought: [true, false].sample
    })
    list_item.save if list_item.valid?
  end

  puts 'Done!'
end
