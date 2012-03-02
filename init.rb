require 'redmine'

Redmine::Plugin.register :redmine_log_time_project_tab do
  name        'Log Time Project Tab'
  author      'Alex Bevilacqua'
  description 'A plugin for Redmine that adds a project tab for time entry'
  url         'https://github.com/alexbevi/redmine_log_time_project_tab'
  author_url  'https://github.com/alexbevi'
  version     '0.1.0'

  requires_redmine :version_or_higher => '1.0.0'

  menu :project_menu, :log_time, { 
                        :controller => 'timelog', 
                        :action     => 'new' 
                      }, 
                      :caption => :button_log_time, 
                      :after   => :overview, 
                      :param   => :project_id ,
        :if =>  Proc.new {
          User.current.allowed_to?({ :controller => 'timelog', :action => 'new' }, :project_id, :global => true)
        }
end
