module Cover
  CASCADE         = './data/haarcascades/haarcascade_frontalface_alt.xml'
  DETECTOR        = CvHaarClassifierCascade::load(CASCADE)

  def self.faces! cv_image, cv_over_image
    DETECTOR.detect_objects(cv_image).each do |region|
      origin           = region.top_left
      size             = CvSize.new(region.width, region.height)
      rect             = CvRect.new(origin.x, origin.y, region.width, region.height) 
      cv_sized_overlay = cv_over_image.resize(size)

      cv_image.set_roi rect
      added            = CvMat.add_weighted(cv_sized_overlay, 1.0, cv_image, 1.0, 0.0)
      added.copy cv_image
    end
    cv_image.reset_roi
    cv_image
  end

end
