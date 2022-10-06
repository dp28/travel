class Meal < ApplicationRecord

  validates :ordering, presence: true, uniqueness: { scope: :day_id }

  belongs_to :day
  has_many :meal_foods, dependent: :destroy
  has_many :foods, through: :meal_foods

end
