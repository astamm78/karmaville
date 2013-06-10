class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :total_karma

  validates :first_name, :presence => true, :on => :create
  validates :last_name, :presence => true, :on => :create

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}, :on => :create

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}, :on => :create

  default_scope order("total_karma DESC")

  def self.by_karma
    order("total_karma DESC")    
  end

  def total_karma_points
    self.karma_points.sum(:value)
  end

  def total_karma
    self.karma_points.sum(:value)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.page(input)
    self.limit(50).offset( 50 * (input.to_i - 1) )
  end

end
