require 'i18n'
I18n.config.enforce_available_locales = true
I18n.default_locale = :ru


RailsAdmin.config do |config|

  config.main_app_name = ["RailsAdmin", "BackOffice"]

  ### Popular gems integration

  # == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  
  
  Rails.application.eager_load!
  ActiveRecord::Base.descendants.each do |imodel|
	  
    config.model "#{imodel}" do
      list do
        exclude_fields :created_at, :updated_at
      end
    end
  end
  
  config.label_methods << :email
  config.label_methods << :description 
  
end
