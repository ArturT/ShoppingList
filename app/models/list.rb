class List < ActiveRecord::Base
  has_many :list_items, dependent: :destroy
  has_many :items, through: :list_items

  belongs_to :user

  validates :name,
    presence: true,
    uniqueness: { scope: [:user_id] }
end
