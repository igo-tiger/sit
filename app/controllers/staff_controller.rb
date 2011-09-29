class StaffController < ApplicationController
  def index
    if params[:commit]=='Search'
      @issues = Issue
      search = 0
      if(params[:department] != '-1')
        @issues = @issues.where(:department=>params[:department])
        search = 1
      end
      if(!params[:subject].blank?)
        @issues = @issues.where("subject like ?",params[:subject].to_s+"%")
        search = 1
      end
      if(params[:to_user] != '-1')
        @issues = @issues.where(:to_user=>params[:to_user])
        search = 1
      end
      if(params[:status] != '-1')
        @issues = @issues.where(:status=>params[:status])
        search = 1
      end
      
      if(search == 0)
        @issues = @issues.all
      end
      
    elsif params[:commit]=='Go'
      id = params[:goto].split('-')[1]
      if Issue.exists?(id)
        redirect_to "/staff/#{id}"
      else
        redirect_to "/staff", notice: 'Issue not found.'
      end
      
    else
      @issues = Issue.all
    end
  end
  
  def show
    @issue = Issue.find(params[:id])
  end
  
  def comment_add
    if params[:text].blank?
      redirect_to "/staff/#{params[:id]}", notice: 'Empty comment.'
    else
      issue_comment = IssueComment.new
      issue_comment.issue_id = params[:id]
      issue_comment.user_id = session[:user_id]
      issue_comment.text = params[:text]
      issue_comment.save
      
      #change status of issue
      issue = Issue.find(params[:id])
      issue.status = 2
      issue.save
      
      redirect_to "/staff/#{params[:id]}", notice: 'Comment added.'
    end
  end
  
  def assign
    issue = Issue.find(params[:id])
    issue.to_user = session[:user_id]
    issue.save
    
    redirect_to staff_url
  end
  
  def unassign
    issue = Issue.find(params[:id])
    issue.to_user = 0
    issue.save
    
    redirect_to staff_url
  end
  
  def set_status
    issue = Issue.find(params[:id])
    issue.status = params[:status]
    issue.save
    
    redirect_to "/staff/#{params[:id]}"
  end

end
