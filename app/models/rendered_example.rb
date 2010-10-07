class RenderedExample < ActiveRecord::Base
  acts_as_commentable
  belongs_to :file, :class_name => OtfFile.name
  belongs_to :example

  scope :correct, :conditions => { :correct => true}
  scope :incorrect, :conditions => { :correct => false}

  def toggle_correctness!
    self.correct = !self.correct
    self.save
    self.file.count_correctness!
  end
end
