class Spare < ApplicationRecord
  enum category: Server::SERVER_LIST
  
  scope :search, -> (query) { where("description LIKE ? OR date_delivered LIKE ? OR date_warranty LIKE ? OR stock LIKE ? OR balance LIKE ?",  "%#{query}%","%#{query}%","%#{query}%","%#{query}%","%#{query}%") }
  

  def delivered
    self.date_delivered.strftime("%b %d, %Y") if self.date_delivered
  end
  
  def warranty
    self.date_warranty.strftime("%b %d, %Y") if self.date_warranty
  end
end
