class OtfLookupRow < ActiveRecord::Base
  belongs_to :lookup, :class_name => OtfLookup.name
  has_many :lookup_classes, :class_name => OtfLookupClass.name, :include => :otf_class, :dependent => :destroy
  has_many :otf_classes, :through => :lookup_classes
  
  def self.build(lookup, body)
    row = self.create(:lookup => lookup)
    body.first.each do |class_body|
      row.lookup_classes << OtfLookupClass.
        build(row, class_body.flatten[0])
    end
    lookup_class = OtfLookupClass.build(row, body[1])
    lookup_class.replace_by_this!
    row.lookup_classes << lookup_class
    row
  end
  
  def to_s
    sub_part = lookup_classes
    by_part = sub_part.pop
    "\t\tsub #{sub_part.map{|c| c.to_s}.join(' ')} by #{by_part.to_s};\n"
  end
end
