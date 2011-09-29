class Issue < ActiveRecord::Base
  has_many :issue_comments

  validates :name, :email, :subject, :text, :presence => true
  DEPARTMENT_LIST = ['AAA','BBB','CCC']
  STATUS_LIST = ['?', 'Waiting for Staff Response', 'Waiting for Customer', 'On Hold', 'Cancelled', 'Completed']
  validates :department, :inclusion => DEPARTMENT_LIST
  
end
