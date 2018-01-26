class Testcase < ActiveRecord::Base
  belongs_to :user
  has_many :feature_testcases
  has_many :features, through: :feature_testcases

  validates :title, presence: true
end
