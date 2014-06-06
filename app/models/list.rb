class List < ActiveRecord::Base
  has_many :list_items, dependent: :destroy
  has_many :items, through: :list_items

  belongs_to :user

  validates :name,
    presence: true,
    uniqueness: { scope: [:user_id] }

  def bought_items
    list_items.where(bought: true).map(&:item)
  end

  def items_to_buy
    list_items.where(bought: false).map(&:item)
  end
end
