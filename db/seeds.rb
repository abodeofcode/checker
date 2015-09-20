# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Promodcodes
Promocode.create(:codetext=> 'HATHI100', :timesused => 0, :discount_value => '100', :validity => true)
Promocode.create(:codetext=> 'HATHI50', :timesused => 0, :discount_value => '50', :validity => true)
Promocode.create(:codetext=> 'HATHI25', :timesused => 0, :discount_value => '25', :validity => true)
Promocode.create(:codetext=> 'HATHI10', :timesused => 0, :discount_value => '10', :validity => true)
Promocode.create(:codetext=> 'HATHI15', :timesused => 0, :discount_value => '15', :validity => true)

#Messages to track the OTPs send through third party system
Message.create(:text=>'123123', :status=>'1', :verified=> true)
Message.create(:text=>'124123', :status=>'1', :verified=> true)
Message.create(:text=>'125123', :status=>'1', :verified=> true)
Message.create(:text=>'456123', :status=>'1', :verified=> true)
Message.create(:text=>'789123', :status=>'1', :verified=> true)

Order.create(:pickup=>"Pickup Adress", :drop=>"Drop Address", :pick_time=>"Mon Jun 02 12:02:39 -0700 2008", :vehicletype=>"asd", :mobilenumber=>"9840942042", :items=>"0", :labour=>1, :couponused=>"1", :verified=>true)


