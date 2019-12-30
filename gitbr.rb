#!/usr/bin/env ruby

require 'open3'

stdout, stderr, status = Open3.capture3("git rev-parse --abbrev-ref HEAD")

if stderr.empty?
  gitstr = 'git_br:' + stdout.chomp

  stdout, stderr, status = Open3.capture3("git status -s")

  print gitstr
end
