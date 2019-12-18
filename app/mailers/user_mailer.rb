class UserMailer < ApplicationMailer

  default from: 'sitapplication@example.com'

  def request_received(user, request)
    @user = user
    @request = request
    mail to: user.email, subject: 'Your request was successfully received!'
  end

  def status_updated(request)
    @request = request
    @user = @request.user
    mail to: @user.email, subject: 'Your request status was updated!'
  end

  def request_deleted(request)
    @request = request
    @user = @request.user
    mail to: @user.email, subject: 'Your request was deleted!'
  end

  def answer(request, answer)
    @request = request
    @user = @request.user
    @answer = answer
    mail to: @user.email, subject: 'Answer from SIT on your request!'
  end

end
