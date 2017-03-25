class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  has_many :answers
  validates :title,:presence => true 
  validates :contents,:presence => true
end
