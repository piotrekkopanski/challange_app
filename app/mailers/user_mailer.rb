class UserMailer < ActionMailer::Base
 
   def notification(question)
     @question = question
     mail to: question.user, subjuct: "notification", from: "pioterkopanski@gmail.com"
  end
end
