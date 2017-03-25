class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :questions
  belongs_to :user
  validates :contents ,:presence => true
  acts_as_votable
 
 after_create :notification
  def notification
   UserMailer.notification(@question).deliver
  end
  
end
