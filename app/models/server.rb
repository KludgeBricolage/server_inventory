class Server < ApplicationRecord
  SERVER_LIST = [:"Storage and Memory", :"Express5800/R110i-1", :"Express5800/120h-1E", :"Express5800/R110j-1"]
  enum machine_model: SERVER_LIST

  scope :search, -> (query) { where("host_name LIKE ? OR machine_model LIKE ? OR operating_system LIKE ? OR role LIKE ? OR project LIKE ? OR date_warranty LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%","%#{query}%", "%#{query}%", "%#{query}%") }

end
