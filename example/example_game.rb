root = File.expand_path("../", File.dirname(__FILE__))
require "#{root}/lib/xox.rb"

puts "Witam w grze w kółko i krzyżyk."
janusz = XOX::Gracz.new( {color: "X", name: "Janusz"})
kazimierz = XOX::Gracz.new( {color: "O", name: "Kazimierz"})
gracze = [janusz, kazimierz]
XOX::Gra.new(gracze).play
