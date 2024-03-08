class Review < ApplicationRecord
  belongs_to :list

  validates :comment, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: { in: 0..5 }
end
