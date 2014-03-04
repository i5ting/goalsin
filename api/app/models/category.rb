class Category < ActiveRecord::Base
  acts_as_nested_set
	
	after_move :rebuild_slug
	around_move :da_fancy_things_around

  private

  def rebuild_slug
    # do whatever
  end

  def da_fancy_things_around
    # do something...
    yield # actually moves
    # do something else...
  end
end
