class IssueCommentsController < ApplicationController
  # GET /issue_comments
  # GET /issue_comments.json
  def index
    @issue_comments = IssueComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @issue_comments }
    end
  end

  # GET /issue_comments/1
  # GET /issue_comments/1.json
  def show
    @issue_comment = IssueComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @issue_comment }
    end
  end

  # GET /issue_comments/new
  # GET /issue_comments/new.json
  def new
    @issue_comment = IssueComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @issue_comment }
    end
  end

  # GET /issue_comments/1/edit
  def edit
    @issue_comment = IssueComment.find(params[:id])
  end

  # POST /issue_comments
  # POST /issue_comments.json
  def create
    @issue_comment = IssueComment.new(params[:issue_comment])

    respond_to do |format|
      if @issue_comment.save
        format.html { redirect_to @issue_comment, notice: 'Issue comment was successfully created.' }
        format.json { render json: @issue_comment, status: :created, location: @issue_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @issue_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /issue_comments/1
  # PUT /issue_comments/1.json
  def update
    @issue_comment = IssueComment.find(params[:id])

    respond_to do |format|
      if @issue_comment.update_attributes(params[:issue_comment])
        format.html { redirect_to @issue_comment, notice: 'Issue comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @issue_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_comments/1
  # DELETE /issue_comments/1.json
  def destroy
    @issue_comment = IssueComment.find(params[:id])
    @issue_comment.destroy

    respond_to do |format|
      format.html { redirect_to issue_comments_url }
      format.json { head :ok }
    end
  end
end
