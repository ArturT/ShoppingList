class List < ActiveRecord::Base
  has_many :list_items
  has_many :items, through: :list_items
end
