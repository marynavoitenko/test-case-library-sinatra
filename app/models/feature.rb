class Feature < ActiveRecord::Base
  has_many :feature_testcases
  has_many :testcases, through: :feature_testcases

  validates :title, presence: true
end
