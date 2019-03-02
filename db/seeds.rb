p "Creating an admin"
user = User.new
user.username = "admin"
user.password = "password"
user.role = 10
user.save!

p "Creating a user"
user = User.new
user.username = "regular"
user.password = "password"
user.save!

p "Creating test servers"
3.times do |i|
  server = Server.new
  server.host_name = "192.168.1.#{i+1}"
  server.model = "Model #{i+1}"
  server.serial_no = "#{rand(1000..5000)} #{rand(1000..5000)} #{rand(10..99)}"
  server.save!
end

p "Creating test spares"
3.times do |i|
  spare = Spare.new
  spare.description = "Description #{i+1}"
  spare.date_delivered = Date.today - i
  spare.date_warranty = Date.today + (i+1).month
  spare.stock = rand(1..100)
  spare.balance = rand(150.00..2000.00).round(2)
  spare.save!
end