require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "complete" do
    mail = OrderMailer.complete
    assert_equal "Complete", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
