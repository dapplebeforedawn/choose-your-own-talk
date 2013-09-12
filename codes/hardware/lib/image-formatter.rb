class Img
  include XbeeUtils
  IMGS      = %w( beer0.gif beer1.gif beer2.gif beer3.gif 
                  beer4.gif beer5.gif beer6.gif )
  MIN, MAX  = 1024/7, 1024 # Shortened for demo purpose
             
  def initialize(msg)
    @msg      = msg
    @options  = Options.get
  end

  def to_s
    idx = (MIN..MAX).each_slice(MAX/IMGS.size).inject(0) do |memo, slice|
      next memo if get_value <= slice.last
      memo + 1
    end
    IMGS[idx]
  end

  def self.handle?
    Options.get.images
  end
  
  def get_value
    # 0x0000 ~ 0x03FF hex can range from 0 ~ 1024
    unpack.slice(-4..-1).hex
  end
  private :get_value
end
