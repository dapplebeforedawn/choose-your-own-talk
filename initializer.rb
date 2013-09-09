require_relative 'lib/node'
Dir[File.join(File.dirname(__FILE__), "lib", "*.rb")].each { |file| require file }
Dir[File.join(File.dirname(__FILE__), "topics", "*.rb")].each { |file| require file }
require_relative 'network'
