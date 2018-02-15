class PrototypesController < ApplicationController
  before_action :set_prototype, only: :show

  def index
    @prototypes = Prototype.all.page(params[:page]).per(8).order("created_at DESC")
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
    3.times {
      # 関連オブジェクトをbuild
      @prototype.tags.build
    }
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: new }), alert: 'New prototype was unsuccessfully created'
     end
  end

  def show
  end

  def destroy
   prototype = Prototype.find(params[:id])
   prototype.destroy if prototype.user_id == current_user.id
   redirect_to :root, notice: 'New prototype was successfully created'
  end

  def edit
    @prototype = Prototype.find(params[:id])
    @captured_images = @prototype.captured_images
  end

  def update
   prototype = Prototype.find(params[:id])
   prototype.update(prototype_params) if prototype.user_id == current_user.id
    redirect_to :root, notice: 'The product has been successfully updated'

  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status],
      tags_attributes: [:title]
    )
  end
end
