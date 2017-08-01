class Device < ActiveRecord::Base
  has_many :measurements
end
