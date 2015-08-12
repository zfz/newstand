class User < ActiveRecord::Base
  has_secure_password

  def author?
    self.role == "author"
  end
end
