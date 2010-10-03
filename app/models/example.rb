class Example < ActiveRecord::Base
  has_many :renderings, :class_name => RenderedExample.name
end
