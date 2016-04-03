class Company < ActiveRecord::Base
  has_many :employees

  validates_presence_of :name

  belongs_to :user
end
