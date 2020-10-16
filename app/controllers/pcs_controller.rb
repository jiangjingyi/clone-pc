class PcsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_pc, only: [:show, :edit, :update, :destroy]
  def index
    @pcs=Pc.all.where(del_flg:0)
    @user = current_user.id
  end
 #get /pcs/new
  def new
    @pc=Pc.new
    
  end  
#post /pcs
  def create
    @pc = Pc.new(pc_params)
    @pc.UPDATE_USER="SYSTEM"
    @pc.del_flg=0
    respond_to do |format|
      if @pc.save
        format.html { redirect_to @pc, notice: '登録が完了しました。' }
        format.json { render :show, status: :created, location: @pc }
      else
        format.html { render :new }
        format.json { render json: @pc.errors, status: :unprocessable_entity }
      end
    end
  end  
# GET /pcs/1/edit
def edit
end

#PATCH/PUT /edit
def update
  respond_to do |format|
    if @pc.update(pc_params)
      format.html { redirect_to @pc, notice: '変更が完了しました。' }
      format.json { render :show, status: :ok, location: @pc }
    else
      format.html { render :edit }
      format.json { render json: @pc.errors, status: :unprocessable_entity }
    end
  end
end
# DELETE /pcs/1
# DELETE /pcs/1.json
  def destroy
    @pc.del_flg=1
    @pc.save
    @pc=Pc.find_by(del_flg: 0)
    respond_to do |format|
      format.html { redirect_to pcs_url, notice: '削除が完了しました。' }
      format.json { head :no_content }
    end
  end
private
    # Use callbacks to share common setup or constraints between actions.
     def set_pc
       @pc = Pc.find(params[:id])
     end
    # Only allow a list of trusted parameters through.

    def pc_params
      params.require(:pc).permit(:PC_NUM, :PC_TYPE, :PC_NANE)
    end
end
