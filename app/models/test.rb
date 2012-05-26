class Test< ActiveRecord::Base
  belongs_to  :category
  has_many :questions, :dependent => :destroy
  has_many :responses
  validates :name,:no_of_questions, :presence => true
  validates :name, :uniqueness => true
  validates :no_of_questions,:numericality => { :only_integer => true }
  validates :category_id, :presence => true
  # :scope => [:category_category_id],
  # validate :my_validation_method
  # def my_validation_method
  #  if self.category_id == "Please Select"
  #    errors.add(:category_id, "You are crazy")
  #    return false
  #  end
  # end
end
