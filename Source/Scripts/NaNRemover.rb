#
#  NaNRemover.rb
#  WaterLapseiOS
#
#  Created by Hector Zarate on 4/21/13.
#  Copyright (c) 2013 International Space Apps. All rights reserved.
#

measurements = File.readlines(ARGV[0])

filtered_measurements = []

measurements.each { |line|

	unless (line.include? "NaN") 
		filtered_measurements << line
	end	
}

file = File.open(ARGV[1], "w")
  file.write(filtered_measurements) 
file.close
