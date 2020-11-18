module Auth
  def login_as_admin
    allow_any_instance_of(Admin::ApplicationController).to receive(:authenticate_user!).and_return(true)
    allow_any_instance_of(Admin::ApplicationController).to receive(:authorize_admin!).and_return(true)
  end

  def login_as_attendee
    allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)
  end
end
