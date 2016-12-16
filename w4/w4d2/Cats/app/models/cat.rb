class Cat < ActiveRecord::Base

  COLORS = %w(black white orange)


  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :name, uniqueness: true
  validates :color, inclusion: {in: COLORS }
  validates :sex, inclusion: { in: ["M","F"]}

  def age
    age = Date.today.year - self.birth_date.year
    age -= 1 if Date.today < self.birth_date + age.years
    age
  end

end
