class Server < ApplicationRecord
  scope :search, -> (query) { where("host_name LIKE ? OR model LIKE ? OR serial_no LIKE ?",  "%#{query}%","%#{query}%","%#{query}%") }
end
