class Property < ApplicationRecord
  has_many :near_stations, dependent: :destory
  accepts_nested_attributes_for :near_stations
  validates :name, presence: true,
  validates :rent, presence: true,
  validates :address, presence: true,
  validates :age, presence: true
end
