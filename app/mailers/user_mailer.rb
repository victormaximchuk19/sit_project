class UserMailer < ApplicationMailer

  default from: 'sitapplication@example.com'

  def request_received(user, request)
    @user = user
    @request = request
    mail to: user.email, subject: 'Request successfully received!'
  end

  def status_updated(request)
    @request = request
    @user = User.find(request.user_id)
    mail to: @user.email, subject: 'Your request status updated!'
  end

  def request_deleted(request)
    @request = request
    @user = User.find(request.user_id)
    mail to: @user.email, subject: 'Your request was deleted!'
  end

  def answer(request, answer)
    @request = request
    @user = User.find(request.user_id)
    @answer = answer
    mail to: @user.email, subject: 'Answer on your request!'
  end

end
