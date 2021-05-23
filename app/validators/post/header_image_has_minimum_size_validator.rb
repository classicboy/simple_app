class Post::HeaderImageHasMinimumSizeValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    image = MiniMagick::Image.open(record.header_image.path)
    record.errors.add(attribute, 'should be 1600x900px minimum!') unless image[:width] > 1600 && image[:height] > 900
  end
end
