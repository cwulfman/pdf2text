require 'RMagick'
require 'rtesseract'

class PDFConverter

  def initialize(fname, lang)
    raise ArgumentError, 'no input file' if fname.nil?
    @fname = fname
    @lang  = lang
    @images = Magick::ImageList.new(fname) do
      self.density = '200'
    end
  end

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
