class Item < ActiveRecord::Base
  has_many :list_items
  has_many :lists, through: :list_items
end
