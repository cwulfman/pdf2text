#!/usr/bin/env ruby

require './pdfconverter.rb'

fname = ARGV[0]
raise ArgumentError, "no input file" if fname.nil?

raise ArgumentError, "file doesn't exist" unless File.file?(fname)

converter = PDFConverter.new(fname)
converter.to_s
