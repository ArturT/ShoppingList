class ListItem < ActiveRecord::Base
  belongs_to :list
  belongs_to :item

  validates :item,
    presence: true,
    uniqueness: { scope: [:list_id] }

  validates :list,
    presence: true
end
