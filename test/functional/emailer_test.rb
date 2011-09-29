require 'test_helper'

class EmailerTest < ActionMailer::TestCase
  test "issue_new" do
    mail = Emailer.issue_new
    assert_equal "Issue new", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "issue_comment" do
    mail = Emailer.issue_comment
    assert_equal "Issue comment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
