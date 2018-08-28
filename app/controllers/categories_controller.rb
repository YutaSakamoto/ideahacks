class CategoriesController < ApplicationController

  def business
    @category = Category.find(1)
  end

  def life
    @category = Category.find(2)
  end

  def planning
    @category = Category.find(3)
  end

  def technology
    @category = Category.find(4)
  end

  def art
    @category = Category.find(5)
  end

  def event
    @category = Category.find(6)
  end

  def hobby
    @category = Category.find(7)
  end

end
