class CategoriesController < ApplicationController

  def business
    @category = Category.find(1)
    @user = User.find_by(params[:id])
  end

  def life
    @category = Category.find(2)
    @user = User.find_by(params[:id])
  end

  def planning
    @category = Category.find(3)
    @user = User.find_by(params[:id])
  end

  def technology
    @category = Category.find(4)
    @user = User.find_by(params[:id])
  end

  def art
    @category = Category.find(5)
    @user = User.find_by(params[:id])
  end

  def event
    @category = Category.find(6)
    @user = User.find_by(params[:id])
  end

  def hobby
    @category = Category.find(7)
    @user = User.find_by(params[:id])
  end

end
