class AccountsController < ApplicationController
  before_action :set_account, only: [ :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  
  def index
    @accounts = Account.all
    @costs =Cost.all.order('start_time ,end_time asc')
    @grouped_months = @accounts.group_by { |r| r.buy_date.beginning_of_month}
    
    if params[:search]
        @accounts = Account.order('buy_date asc').where('name LIKE ? OR title LIKE ? OR buy_store LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").joins(:sort)
    else
        @accounts = Account.all.order('buy_date asc')
    end
    
    # @search = Account.search do
    #   fulltext params[:search]
    # end
    # @accounts = @search.results
  end
  
  def budget
    @accounts = Account.all
    @costs =Cost.all.order('start_time ,end_time asc')
    @grouped_months = @accounts.group_by { |r| r.buy_date.beginning_of_month}
    @puts=['01','02','03','04','05','06','07','08','09','10','11','12']
    @month_total=[]
    @month_cost=[]
    @month_breakfast_total=[]
    @month_lunch_total=[]
    @month_dinner_total=[]
    @month_drink_total=[]
    
    @year=Time.now.year.to_s
    @month=Time.now.month
    
    (0..11).each do |i|
      @month_total[i] = Account.where(['buy_date between ? and ?','2015-'+ @puts[i] +'-01','2015-'+ @puts[i] +'-31']).sum(:buy_price)
      
      @month_cost[i] = Cost.where(['start_time between ? and ? and end_time between ? and ?','2015-'+ @puts[i] +'-01','2015-'+ @puts[i] +'-31','2015-'+ @puts[i] +'-01','2015-'+ @puts[i] +'-31']).order('start_time desc')
      
      @month_breakfast_total[i] = Account.where('buy_date between ? and ? and title=?','2015-'+ @puts[i] +'-01','2015-'+ @puts[i] +'-31',"早餐").joins(:sort).sum(:buy_price)
      @month_lunch_total[i] = Account.where(['buy_date between ? and ? and title=?','2015-'+ @puts[i] +'-01','2015-'+ @puts[i] +'-31',"午餐"]).joins(:sort).sum(:buy_price)
      @month_dinner_total[i] = Account.where(['buy_date between ? and ? and title=?','2015-'+ @puts[i] +'-01','2015-'+ @puts[i] +'-31',"晚餐"]).joins(:sort).sum(:buy_price)
      @month_drink_total[i] = Account.where(['buy_date between ? and ? and title=?','2015-'+ @puts[i] +'-01','2015-'+ @puts[i] +'-31',"飲料"]).joins(:sort).sum(:buy_price)
    end
    
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end
  
  def statistic
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :buy_price, :num, :buy_date, :buy_store, :sort_id)
    end
end
