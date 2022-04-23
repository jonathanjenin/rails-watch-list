class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie, presence: true
  validates :list, presence: true
  validates_uniqueness_of :movie, scope: :list
  validates :comment, length: { minimum: 6 }
end
