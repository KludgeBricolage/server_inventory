class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, password_length: 1..128
  enum role: { regular: 0, admin: 10 }


  scope :search, -> (query) { where("username LIKE ? OR role LIKE ? OR first_name LIKE ? OR last_name LIKE ?",  "%#{query}%","%#{query}%", "%#{query}%", "%#{query}%") }

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

  def full_user
    "#{self.first_name} #{self.last_name}".strip + " (#{self.role.upcase})"
  end

  def whole_role
    case self.role
    when 'regular'
      "Regular"
    when 'admin'
      "Administrator"
    end
  end
end
