class KeihiheadsController < ApplicationController
  before_action :set_keihi, only: [:show, :edit, :update, :destroy]
  before_action :set_modal, only: [:new, :edit, :update, :destroy]
  # load_and_authorize_resource

  respond_to :js

  def index

  end

  def show
  end

  def new
    @keihi = Keihihead.new
    shinsheino = 1
    # shinsheino = Keihihead.maximum(:id) + 1 if Keihihead.exists?
    shinsheino = Keihihead.pluck(:id).map {|i| i.to_i}.max + 1

    # shinsheino = Keihihead.order(id: :desc).first.id.to_i + 1 if Keihihead.exists?
    @keihi.id = shinsheino.to_s
    @keihi.keihibodys.build

    respond_with(@keihi)
  end

  def edit
    @keihi.keihibodys.build
  end

  def create
    case params[:commit]
      when '経費データ検索'
        begin
          @keihi = Keihihead.find keihi_params[:申請番号]
          if @keihi.承認kubun == '1'
            redirect_to keihihead_url(@keihi)
          else
            redirect_to edit_keihihead_url(@keihi)
          end
        rescue ActiveRecord::RecordNotFound
          flash[:warning] = t "app.flash.record_not_found"
          redirect_to :back
          return
        end

      when '登　録'
        params[:keihihead][:日付] = Date.today if keihi_params[:日付].blank?
        @keihi = Keihihead.new(keihi_params)
        flash[:notice] = t 'app.flash.new_success' if @keihi.save
        # respond_with(@keihi, location: keihis_url)
        redirect_to new_keihihead_url
    end

  end

  def update
    case params[:commit]
      when '登　録'
        params[:keihihead][:日付] = Date.today if keihi_params[:日付].nil?
        flash[:notice] = t "app.flash.update_success" if @keihi.update(keihi_params)
        # respond_with(@keihi)
        redirect_to new_keihihead_url
      when '削　除'
        flash[:notice] = t "app.flash.delete_success" if @keihi.destroy
        respond_with @keihi, location: new_keihihead_url
    end
  end

  def destroy
    @keihi.destroy
    respond_with(@keihi, location: new_keihihead_url)
  end

  def matching
    if  params[:commit] == '更新する' && !params[:shonin].nil?
      flash[:notice] = t 'app.flash.update_success' if Keihihead.where(id: params[:shonin]).update_all(承認済区分: '1')
    end
    seisanyoteibi = keihi_params[:清算予定日]
    shoninsha = keihi_params[:承認者]
    seisanyoteibi = Date.today if keihi_params[:清算予定日].blank?
    shoninsha = session[:user] if keihi_params[:承認者].blank?
    @keihi_shonins = Keihihead.where("清算予定日 <= ? and 承認者 = ? and 承認済区分 <> '1'", seisanyoteibi, shoninsha)
    @keihi_shonin = Keihihead.new(清算予定日: keihi_params[:清算予定日], 承認者: keihi_params[:承認者])
    render 'shonin'
  end

  def ajax
    case params[:id]
      when 'getshinshei'
        date = params[:date]
        listshinshei = Keihihead.current_member(session[:user]).order(updated_at: :desc).pluck(:申請番号)
        listshinshei = Keihihead.current_member(session[:user]).where(日付: date).pluck(:申請番号) if !date.blank?
        data = {listshinshei: listshinshei}
        respond_to do |format|
          format.json { render json: data}
        end
    end
  end

  def shonin
    @keihi_shonins = Keihihead.none
    @keihi_shonin = Keihihead.new
  end

  private
  def set_keihi
    @keihi = Keihihead.find(params[:id])
  end
  
  def set_modal
    @kaishamasters = Kaishamaster.all
    @kikans = Kikanmst.all
    @ekis = Eki.all
    # @shonins = Shoninshamst.current_user(session[:user])
    @shonins = Shoninshamst.all
    @jobs = Jobmaster.all
  end
  
  def keihi_params
    params.require(:keihihead).permit(:申請番号, :日付, :社員番号, :申請者, :交通費合計, :日当合計, :宿泊費合計, :その他合計,
                                      :旅費合計, :仮払金, :合計, :支給品, :過不足, :承認kubun, :承認者, :清算予定日, :清算日, :承認済区分,
                                      keihibodys_attributes: [:id, :申請番号, :日付, :社員番号, :相手先, :機関名,
                                                              :発, :着, :発着kubun, :交通費, :日当, :宿泊費, :その他, :JOB,
                                                              :備考, :領収書kubun, :_destroy])
  end
end