class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @tag_name = %w[]
    @tag_count = []
    i = 0
    Tag.order_as_specified(id:[2,3,4,1,5,6]).each do |t|
      tag_name = %q[t.name]
      @tag_name.insert(i, tag_name)
      t = t.users.where(company: current_user.company).count
      @tag_count.insert(i, t)
      i += 1
    end
  end
end
