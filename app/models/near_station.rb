class NearStation < ApplicationRecord
  belongs_to :property
  validates :name, presence: true,
  validates :route, presence: true,
  validates :required_time, presence: true,
end
