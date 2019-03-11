p "Creating an admin"
user = User.new
user.username = "admin"
user.password = "password"
user.first_name = "Jesus"
user.last_name = "Hordejan"
user.role = 10
user.save!

p "Creating a user"
user = User.new
user.username = "regular"
user.password = "password"
user.first_name = "Regular"
user.last_name = "User"
user.save!

p "Creating test servers"
host_names = ["r3r33nSPARK", "r14d05MASTER", "phVr14e07", "r2r33nSPARK"]
machine_models = [1,2,3,1]
operating_systems = ["Ubuntu 14.04.5 LTS", "Ubuntu 14.04.4", "Ubuntu 16.04.6", "Ubuntu 18.04.2"]
roles = ["Staging", "Spark Node", "Worker", "Worker"]
projects = ["Talino", "Juggernaut", "Juggernaut", "Juggernaut"]
warranty_dates = ["27/Feb/2020", "30/Jan/2021", "30/Jan/2021", "27/Feb/2020"]

4.times do |i|
  server = Server.new
  server.host_name = host_names[i]
  server.machine_model = machine_models[i]
  server.operating_system = operating_systems[i]
  server.role = machine_models[i]
  server.project = projects[i]
  server.date_warranty = warranty_dates[i].to_datetime
  server.save!
end


p "Creating test spares for servers"
item_types = ["Processor", "Processor", "phVr14e07-Kafka01"]
descriptions = ["Intel Xeon Processor Bronze - 3104(6C/6T, 1.70 GHz, 8.25MB)", "Intel Xeon Processor Silver - 4108(8C/16T, 1.80 GHz, 11M)", "Intel Xeon Processor Gold - 5115(10C/20T, 2.40 GHz, 13.75MB)"]
stocks = [1, 3, 0]
delivered_dates = ["5/Mar/2019", "6/Mar/2019", "1/Jan/2015"]
warranty_dates = ["5/Mar/2022", "6/Mar/2019", "1/Jan/2015"]
balances = [10000.00, 15000.00, 9000.00]
categories = [1,2,3]

3.times do |i|
  spare = Spare.new
  spare.item_type = item_types[i]
  spare.description = descriptions[i]
  spare.stock = stocks[i]
  spare.date_delivered = delivered_dates[i]
  spare.date_warranty = warranty_dates[i]
  spare.balance = balances[i]
  spare.category = categories[i]
  spare.save!
end

p "Creating test spares for storage and memories"
item_types = ["Storage Device", "Memory", "Storage Device"]
descriptions = ["Hot plug 2.5-inch SAS HDD", "DDR4-2666 ECC RDIMM / LRDIMM", "Hot plug 2.5-inch SAS SSD)"]
stocks = [1, 3, 0]
delivered_dates = ["5/Mar/2019", "6/Mar/2019", "1/Jan/2015"]
warranty_dates = ["5/Mar/2022", "6/Mar/2019", "1/Jan/2015"]
balances = [10000.00, 15000.00, 9000.00]

3.times do |i|
  spare = Spare.new
  spare.item_type = item_types[i]
  spare.description = descriptions[i]
  spare.stock = stocks[i]
  spare.date_delivered = delivered_dates[i]
  spare.date_warranty = warranty_dates[i]
  spare.balance = balances[i]
  spare.category = 0
  spare.save!
end 