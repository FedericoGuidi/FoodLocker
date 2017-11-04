class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
    
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
    
  def default_url
    [version_name, "default.png"].compact.join('_')
  end

  version :thumb do
    process :crop
    resize_to_fill(100, 100)
  end

  version :tiny, from_version: :thumb do
    process resize_to_fill: [30, 30]
  end
    
  version :micropost, from_version: :thumb do
      process resize_to_fill: [50, 50]
  end

  version :large do
    resize_to_limit(600, 600)
  end

  def crop
    if model.crop_x.present?
      resize_to_limit(600, 600)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        # [[w, h].join('x'),[x, y].join('+')].join('+') => "wxh+x+y"
        img.crop([[w, h].join('x'),[x, y].join('+')].join('+'))
      end
    end
  end
end