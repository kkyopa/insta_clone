class TuitaController < ApplicationController
  before_action :set_tuitum, only: [:show, :edit, :update, :destroy]

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
      if @tuitum.save
        redirect_to tuita_path, notice: "投稿されました"
      else
        render 'new'
      end
  end
  
  def update
      if @tuitum.update(tuitum_params)
        redirect_to tuitum_path, notice: "編集しました！"
      else
        render 'edit'
      end
  end

 
  def destroy
    @tuitum.destroy
      redirect_to tuitum_params, notice:"削除しました！"
  end
  
   def show
     
   end
   
   def confirm
     @tuitum = Tuitum.new(tuitum_params)
     render :new if @tuitum.invalid?
   end

  private
    def set_tuitum
      @tuitum = Tuitum.find(params[:id])
    end

  
    def tuitum_params
      params.require(:tuitum).permit(:content)
    end
end
