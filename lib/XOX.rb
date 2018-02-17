require_relative "xox/version"
require_relative "./xox/komorka.rb"
require_relative "./XOX/gracz.rb"
require_relative "./xox/tablica.rb"
require_relative "./xox/core_extensions.rb"
require_relative "./xox/gra.rb"

module XOX
  # Your code goes here...
end

lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/tic_tac_toe/**/*.rb"].each { |file| require file }