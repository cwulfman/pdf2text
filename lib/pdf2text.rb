#!/usr/bin/env ruby

require './pdfconverter.rb'
require 'optparse'

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: pdf2text filename -l language'
  opts.on('-l', '--lang lang', 'language') do |lang|
    options[:lang] = lang
  end
end

optparse.parse!

fname = ARGV[0]
lang = options[:lang] ? options[:lang] : 'eng'
raise ArgumentError, "no input file" if fname.nil?

raise ArgumentError, "file doesn't exist" unless File.file?(fname)

converter = PDFConverter.new(fname, lang)
converter.to_s
