class WelcomeController < ApplicationController
    
  def index
    @trees = Tree.all
    @locals = Local.all
  end

  def arvores
     @trees = Tree.where(:user => current_user)
  end
  
  def plantei
      @tree = Tree.new
  end
  
  def plantei_create
    @tree = Tree.new(tree_params)
    @tree.user = current_user
    if @tree.save
      flash[:success] = "Árvore registrada!"
      redirect_to root_url
    else
      render 'plantei'
    end
  end
  
  def local
      @local = Local.new
  end
  
  def local_create
    @local = Local.new(local_params)
    @local.user = current_user
    if @local.save
      flash[:success] = "Local registrado!"
      redirect_to root_url
    else
      render 'local'
    end
  end

  def hashtag
  end

  def doe
  end

  def porque_plantar
  end
  
  private

    def tree_params
      params.require(:tree).permit(:name, :address, :latitude, :longitude)
    end
    
    def local_params
      params.require(:local).permit(:name, :address, :latitude, :longitude)
    end
end
