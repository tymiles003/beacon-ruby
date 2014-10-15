class Failure < Devise::FailureApp
  def respond
    self.status = :unauthorized
    self.content_type = 'application/json'
    self.response_body = "{ 'error' : '#{I18n.t("devise.failure.unauthenticated")}' }"
  end
end