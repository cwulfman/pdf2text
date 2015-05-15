require 'RMagick'
require 'rtesseract'

# A simple class to run OCR on a PDF file.
#
# Author::   Clifford Wulfman (mailto:cwulfman@princeton.edu)

class PDFConverter

  # Initialize an instance with a file name
  # (file path) and an optional language
  # parameter, raising an error if no file is provided.
  # Complete initialization by extracting each
  # page image and converting it to a resolution
  # of 200 ppi, which seems optimal for OCR.
  #
  # Params:
  # +fname+:: path to pdf file to be processed
  # +lang+:: optional language specifier.
  # TODO: check to make sure lang is in the
  # set of accepted tesseract language keys.
  def initialize(fname, lang)
    raise ArgumentError, 'no input file' if fname.nil?
    @fname = fname
    @lang  = lang
    @images = Magick::ImageList.new(fname) do
      self.density = '200'
    end
  end

  # Iterate over the images in the object,
  # running each through tesseract.
  def to_s
    @images.each do |img|
      tess = RTesseract.new('', :lang => @lang)
      tess.from_blob(img.to_blob {self.format = 'jpg';
                       self.depth = 8;
                       self.quality = 95 } )
      puts tess.to_s
    end
  end  
end
