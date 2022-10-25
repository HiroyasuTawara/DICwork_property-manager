class Property < ApplicationRecord
  has_many :near_stations, dependent: :destroy
  accepts_nested_attributes_for :near_stations, reject_if: lambda {|attributes| attributes[:name].blank? || attributes[:route].blank?} , allow_destroy: true
end
