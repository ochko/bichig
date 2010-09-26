class User < ActiveRecord::Base
  is_gravtastic!
  has_many :rows, :class_name => OtfLookupRow.name
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def name
    self.email.split('@').first
  end

  def to_s
    self.name
  end

end
