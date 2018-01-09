class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  ### is it right to put customize methods?
  def filter_index_profile_by_category?
  	return true
  end
end
