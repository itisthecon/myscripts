#!/usr/bin/env ruby

require 'find'
require 'digest'
require 'pathname'
require 'colorize'

if ARGV.length != 2
  puts "useage: difftree dir1 dir2"
  exit
end

pwd = Dir.pwd + '/'
(dir1, dir2) = ARGV.map do |arg|
  arg = pwd + arg if arg[0] != '/'
  arg = arg + '/' if arg[-1] != '/'
  arg
end

Find.find(dir1) do |path|
  next if File.directory?(path)

  rel_path = Pathname.new(path).relative_path_from(Pathname.new(dir1))
  path2 = dir2 + rel_path.to_s

  unless File.exist?(path2)
    puts "!!! ".colorize(:yellow).blink + path2.colorize(:red) + " do not exist"
    next
  end

  puts `/usr/local/bin/colordiff -u #{path} #{path2}` unless Digest::MD5.file(path).hexdigest == Digest::MD5.file(path2).hexdigest
end
