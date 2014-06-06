class Item < ActiveRecord::Base
  has_many :list_items
  has_many :lists, through: :list_items

  validates :name,
    presence: true,
    uniqueness: true
end
