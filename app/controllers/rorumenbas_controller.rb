class RorumenbasController < ApplicationController
  before_action :set_rorumenba, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: :export_csv

  def new
    @shains = Shainmaster.all
  	@rorumenba = Rorumenba.new
    respond_with(@rorumenba)
  end

  def index
    @shains = Shainmaster.all
  	@rorumenba = Rorumenba.all
  end

  def show
    @shains = Shainmaster.all
    respond_with(@rorumenba)
  end

  def create
    @shains = Shainmaster.all
    @rorumenba = Rorumenba.new(rorumenba_params)
    @rorumenba.save
    respond_with(@rorumenba)
  end

  def update
    @shains = Shainmaster.all
    @rorumenba.update(rorumenba_params)
    respond_with(@rorumenba)
  end

  def destroy
    @shains = Shainmaster.all
    @rorumenba.destroy
    respond_with(@rorumenba)
  end

  private
    def set_rorumenba
      @rorumenba = Rorumenba.find(params[:id])
    end

    def rorumenba_params
      params.require(:rorumenba).permit(:ロールコード, :社員番号, :氏名, :ロール内序列)
    end
end
