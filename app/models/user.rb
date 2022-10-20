class User < ApplicationRecord
  rolify
  has_paper_trail on: [:update] 
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :tasks, class_name:"Task", foreign_key:"reporter_id"
  has_many :developers, class_name:"User", foreign_key:"lead_id"
  belongs_to :lead, class_name:"User", optional: true


  after_create :assign_default_role

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  def assign_default_role
    @number_of_users = User.all.count
    if @number_of_users == 1 
      self.add_role(:manager) if self.roles.blank?
    else  
      self.add_role(:newuser) if self.roles.blank?
    end
  end       
           
end
