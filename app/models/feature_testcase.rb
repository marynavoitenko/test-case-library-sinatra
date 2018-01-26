class FeatureTestcase < ActiveRecord::Base
  belongs_to :feature
  belongs_to :testcase
end
