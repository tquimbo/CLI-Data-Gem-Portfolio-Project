#access to all the files we need to run our application
require 'pry' #just require for external libs and its an absolute path
require 'httparty' 

require_relative('../lib/api') #for files inside our directory #. goes up a spot (config) #.. goes up to top of cli
require_relative('../lib/cli') 
# require_relative('.. /lib/location')
