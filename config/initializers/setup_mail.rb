ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address        => "smtp.gmail.com",
    :port           => 587,
    :authentication => :plain,
    :user_name      => "support@gurume.co.uk",
    :password       => "gurume!@#"
}