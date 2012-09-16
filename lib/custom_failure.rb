class CustomFailure < Devise::FailureApp

  def respond
      redirect
  end
end