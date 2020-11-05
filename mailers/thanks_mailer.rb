class ThanksMailer < ApplicationMailer
  def complete_registration(user)
    @user = user
    mail(:subject => "登録が完了しました！", to: user.email)
  end
end
