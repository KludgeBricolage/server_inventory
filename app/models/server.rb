class Server < ApplicationRecord
  SERVER_LIST = [:"Storage and Memory", :"Express5800/R110i-1", :"Express5800/120h-1E", :"Express5800/R110j-1"]
  enum machine_model: SERVER_LIST

  scope :search, -> (query) { where("host_name LIKE ? OR model LIKE ? OR serial_no LIKE ?",  "%#{query}%","%#{query}%","%#{query}%") }

end
