class ShareMailer < ActionMailer::Base
  # send a signup email to the user, pass in the user object that contains the user's email address
  default :from => "bucketer@worldofbuckets.com"
  
  def share_email options
    @options = options
    mail to: options[:target_email], subject: "#{ options[:name] } wanted to share this with you!"
  end
end
