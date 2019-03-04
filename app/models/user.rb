class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  enum role: { regular: 0, admin: 10 }


  scope :search, -> (query) { where("username LIKE ? OR role LIKE ?",  "%#{query}%","%#{query}%") }

  def email_required?
    false
  end
  
  def email_changed? 
    false 
  end
  
  def will_save_change_to_email?
    false
  end

  def postpone_email_change?
   false 
end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if username = conditions.delete(:username)
      where(conditions).where(["lower(username) = :value", { :value => username.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
end
