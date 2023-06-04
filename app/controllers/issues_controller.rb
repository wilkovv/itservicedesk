class IssuesController < ApplicationController
  require 'date'
  skip_before_action :verify_authenticity_token
  before_action :set_issue, only: %i[ show edit update destroy ]
  before_action :authenticate_user_or_serviceman!, only: %i[ show myissues mystats ]
  before_action :authenticate_user!, only: %i[ new create ]
  before_action :authenticate_serviceman!, only: %i[ index edit update destroy ]
  
  # GET /issues or /issues.json
  def index
    @issues = Issue.all
  end

  # GET /myissues or /myissues.json
  def myissues
    @issues = []
    if user_signed_in?
      @issues = Issue.where(user_id: current_user.id)
    elsif serviceman_signed_in?
      @issues = Issue.where(serviceman_id: current_serviceman.id)
    end
  end

  # GET /myissues/statistics or /myissues/statistics.json

  def mystats
    @issues = myissues()
    current_date = Date.today

    @issues_open = {}
    @issues_created = {}
    @issues_done_closed = {}
    (0..30).each do |offset|
      date = current_date - 30 + offset
      beginning_of_day = Time.new(date.year, date.month, date.day, 0, 0, 0)

      @issues_created[date] = @issues.where("created_at >= ? AND created_at <= ?", beginning_of_day, date.end_of_day).count
      @issues_done_closed[date] = @issues.where("(status_string IN (?)) AND updated_at >= ? AND updated_at <= ?",['Done', 'Closed'], beginning_of_day, date.end_of_day).count
      @issues_open[date] = @issues.where("(status_string IN (?) AND created_at <= ?) OR (updated_at >= ? AND created_at <= ?)", ['New', 'In progress'], date.end_of_day, date.end_of_day, date.end_of_day).count
    end
    respond_to do |format|
      format.json { render 'statistics' }
      format.html { render :mystats }
    end
  end

  # GET /issues/1 or /issues/1.json
  def show
    if user_signed_in?
      if @issue.user_id != current_user.id
      redirect_to myissues_path()
      end
    end
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues or /issues.json
  def create
    servicemen = Serviceman.all
    @issue = Issue.new(issue_params)

    serviceman_with_least_issues = serviceman = Serviceman.joins(:issues)
    .where(issues: { category: issue_params[:category] })
    .where(category: issue_params[:category])
    .group(:id)
    .order('COUNT(issues.id) ASC')
    .first


    @issue.serviceman_id = serviceman_with_least_issues.id

    @issue.user_id = current_user.id
    @issue.service_comment = ""
    @issue.status_string = "New"

    respond_to do |format|
      if @issue.save
        format.html { redirect_to issue_url(@issue), notice: "Issue was successfully created." }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1 or /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to issue_url(@issue), notice: "Issue was successfully updated." }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1 or /issues/1.json
  def destroy
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url, notice: "Issue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issue_params
      params.require(:issue).permit(:serviceman_id, :user_id, :photo, :description, :category, :service_comment, :status_string, :title)
    end

    def authenticate_user_or_serviceman!
      if not serviceman_signed_in?
        authenticate_user!
      else
        authenticate_serviceman! 
      end
    end

end
