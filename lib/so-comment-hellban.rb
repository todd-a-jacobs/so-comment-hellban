#!/usr/bin/env ruby
# encoding: UTF-8

# Name:
#    so-comment-hellban.rb
#
# Purpose:
#    This is a calculator for determining how close a user is to being
#    comment-hellbanned on Stack Overflow. You can find your flag counts at 
#    http://stackoverflow.com/users/flag-summary/<stackoverflow_userid>.
#
# Usage:
#     ruby so-comment-hellban.rb <declined_flags> <helpful_flags>
#
# Options:
#     none
#
# Exit Status Codes:
#     0  = Success
#     64 = Command line usage error
#
# Caveats:
#     - The flag weight calculation is subject to change, so don't bet the farm
#       on it.
#     - The flag counts are only visible to logged in users, and (generally)
#       only your own flag counts. Without authentication, this calculator can't
#       scrape the values for you; you have to enter them on the command line.
#       Patches welcome.
#
# Copyright:
#     Copyright 2012 Todd A. Jacobs
#     All Rights Reserved
#
# License:
#     Released under the GNU General Public License (GPL)
#     http://www.gnu.org/copyleft/gpl.html
#
#     This program is free software; you can redistribute it and/or modify it
#     under the terms of the GNU General Public License as published by the Free
#     Software Foundation; either version 3 of the License, or (at your option)
#     any later version.
#
#     This program is distributed in the hope that it will be useful, but
#     WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
#     or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
#     for more details.

require "so-comment-hellban/version"

module SO_Comment_Hellban
  class Hellban
    attr_reader :declined_flags, :helpful_flags

    def initialize(declined_flags, helpful_flags)
      @declined_flags, @helpful_flags = 
        declined_flags.to_i, helpful_flags.to_i
      get_counts unless @declined_flags and @helpful_flags
    end

    def report
      puts '# Stack Overflow Comment-Hellban Calculator'
      puts
      puts  "  - Current Flag Weight: #{flag_weight}"
      print '  - Hellban Status: '

      if comment_hellbanned?
        puts 'You are hellbanned.'
        puts
        puts 'See http://meta.stackoverflow.com/questions/82445/comment-hellban'
        puts 'for more information.'
      else
        puts "You aren't banned...yet."
      end
    end

    def self.usage
      warn "Usage: #{File.basename $0} <declined_flags> <helpful_flags>"
      exit 64
    end

    def self.valid_args?
      ARGV.size == 2 and
      ARGV.all? {|arg| arg.to_s =~ /^\d+$/ }
    end

    private

    def comment_hellbanned?
      flag_weight <= 0 ? true : false
    end

    def flag_weight
      (@helpful_flags + 10) - @declined_flags
    end

    def unindent string
      string.strip.gsub /\s*\n\s*/, "\n"
    end
  end
end

if __FILE__ == $0
  SO_Comment_Hellban::Hellban.usage unless
    SO_Comment_Hellban::Hellban.valid_args?
  SO_Comment_Hellban::Hellban.new(ARGV.first, ARGV.last).report
end
