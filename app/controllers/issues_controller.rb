class IssuesController < ApplicationController
  skip_before_filter :authorize
  
  # GET /issues
  # GET /issues.json
  def index
    if session[:ref].nil?
      #session[:ref] = Digest::SHA2.hexdigest(Time.now.to_s + 'ts')
      session[:ref] = session[:session_id]
    end
    if params[:ref]
      session[:ref] = params[:ref]
    end
    @issues = Issue.where(:ref=>session[:ref])

    if @issues.count==0
      flash[:notice] = "You haven't issues. You can add them by pressing *New Issue*"
    else
      flash[:notice] = nil
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @issues }
    end
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue = Issue.find(params[:id])
    #check access
    if @issue.ref != session[:ref]
      return redirect_to issues_url
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @issue }
    end
  end
  
  # POST /issues/1
  def comment_add
    issue = Issue.find(params[:id])
    #check access
    if issue.ref != session[:ref]
      return redirect_to issues_url
    end
    
    if !params[:text].blank?
      issue_comment = IssueComment.new
      issue_comment.issue_id = params[:id]
      issue_comment.text = params[:text]
      issue_comment.save
      
      #change status of issue
      issue.status = 1
      issue.save
    end
    redirect_to "/issues/#{params[:id]}"
  end

  # GET /issues/new
  # GET /issues/new.json
  def new
    @issue = Issue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params[:id])
    #check access
    if @issue.ref != session[:ref]
      return redirect_to issues_url
    end
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(params[:issue])
    @issue.ref = session[:ref]
    @issue.to_user = 0
    @issue.status = 1

    respond_to do |format|
      if @issue.save
        Emailer.issue_new(@issue).deliver #send mail
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render json: @issue, status: :created, location: @issue }
      else
        format.html { render action: "new" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /issues/1
  # PUT /issues/1.json
  def update
    @issue = Issue.find(params[:id])
    #check access
    if @issue.ref != session[:ref]
      return redirect_to issues_url
    end

    respond_to do |format|
      if @issue.update_attributes(params[:issue])
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue = Issue.find(params[:id])
    #check access
    if @issue.ref != session[:ref]
      return redirect_to issues_url
    end
    
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :ok }
    end
  end
end
