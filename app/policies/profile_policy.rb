class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def filter_index_profile_by_category?
  	return true
  end

  def add_category_session?
  	return true
  end

  def add_company_skill_session?
    return true
  end

  def remove_company_skill_session?
    return true
  end

  def filter_show?
    return true
  end

end
