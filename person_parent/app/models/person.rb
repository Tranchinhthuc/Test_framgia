class Person < ActiveRecord::Base
  belongs_to :parent, class_name: "Person"
  has_many :children, class_name: "Person", foreign_key: "parent_id"

  def grandchildren
    self.children.map{|child| child.children}.flatten
  end
end
