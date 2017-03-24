class WelcomeMailer < ActionMailer::Base
  
   def notification_answer(answer)
   @answer = answer
   mail to: answer.user, subjuct: "notification-answer", from: "pioterkopanski@gmail.com"
  end

end
