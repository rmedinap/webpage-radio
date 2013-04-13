ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "stereosonicaradio.com",
  :user_name            => "info@stereosonicaradio.com",
  :password             => "stereosonica99",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
