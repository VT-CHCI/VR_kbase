class AdminMailer < ActionMailer::Base
  default from: "knowledgebasevr@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://vrknowledgebase.cs.vt.edu'
    mail(to: @user.email, subject: 'VR Knowledgebase - Welcome!')
  end

  def new_user_email(user, email)
    @user = user
    @url  = 'http://vrknowledgebase.cs.vt.edu'
    mail(to: email, subject: 'VR Knowledgebase - New User Registered')
  end

  def new_paper_email(paper, email)
  	@paper = paper
    mail(to: email, subject: 'VR Knowledgebase - New Paper Added')
  end

  def edit_paper_email(paper, email)
  	@paper = paper
    mail(to: email, subject: 'VR Knowledgebase - Paper Edited')
  end
end
