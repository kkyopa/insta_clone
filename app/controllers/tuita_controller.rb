class TuitaController < ApplicationController
  before_action :set_tuitum, only: [:show, :edit, :update, :destroy]
  before_action :user_blank, only: [:show, :edit, :new,:destroy]
  before_action :edit_destroy_postonly, only: [:edit,:destroy]
  def top
    
  end
  
  def index
    @tuitum = Tuitum.all
  end


  def new
    @tuitum = Tuitum.new
  end

  def edit
  end

  def create
    @tuitum = Tuitum.new(tuitum_params)
    @tuitum.user_id = current_user.id
      if @tuitum.save
        ContactMailer.contact_mail(@tuitum).deliver
        redirect_to tuita_path, notice: "＄wされました"
      else
        render 'new'
      end
  end
  
  def update
      if @tuitum.update(tuitum_params)
        redirect_to tuita_path, notice: "＄w編集しました！"
      else
        render 'edit'
      end
  end

 
  def destroy
    @tuitum.destroy
      redirect_to tuita_path, notice:"＄w削除しました！"
  end
  
   def show
     @favorite = current_user.favorites.find_by(tuitum_id: @tuitum.id)
   end
   
   def confirm
     @tuitum = Tuitum.new(tuitum_params)
     @tuitum.user_id = current_user.id
     render :new if @tuitum.invalid?
   end

  private
  
    def set_tuitum
      @tuitum = Tuitum.find(params[:id])
    end

    def tuitum_params
      params.require(:tuitum).permit(:name, :content, :image, :image_cache, :user_id)
    end
    
    def user_blank
    if current_user.blank?
      redirect_to sessions_new_path
    end
    end
    
    def edit_destroy_postonly
    unless @tuitum.user_id == current_user.id
      redirect_to tuita_path, notice:"投稿者以外の編集、削除はできません。"
    end
    end
end
