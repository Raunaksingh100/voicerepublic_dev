class Notification::NewStatus < Notification::Base
  attr_accessible :other_id, :user_id, :content, :other, :user
  
  belongs_to :user
  belongs_to :other, :class_name => 'User'
   
  validates :other_id, :user_id, :presence => true
  
  after_create :generate_mail_notification
  
  def to_s
    I18n.t('.friend_created_new_status', :friend => other.name)
  end
  
end
