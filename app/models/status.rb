class Status < ActiveRecord::Base
  attr_protected :up

  validates :up, :inclusion => {:in => [true, false], :message => "status can't be blank"}

  def status
    up ? "up" : "down"
  end

  def status=(status)
    matcher = status.to_s.downcase
    if matcher == "up"
      self.up = true
    elsif matcher == "down"
      self.up = false
    end
  end
end
