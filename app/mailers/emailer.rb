class Emailer < ActionMailer::Base
  default from: "sit.sit@inbox.ru"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.emailer.issue_new.subject
  #
  def issue_new(issue)
    @issue = issue

    mail :to => issue.email, :subject => 'Support Issue Tracking [issue new]'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.emailer.issue_comment.subject
  #
  def issue_comment(issue)
    @issue = issue

    mail :to => issue.email, :subject => 'Support Issue Tracking [issue comment]'
  end
end
