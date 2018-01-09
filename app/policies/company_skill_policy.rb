class CompanySkillPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def remove_category_session?
  	return true
  end

  def remove_company_skill_session?
  	return true
  end

  def add_company_skill_session?
  	return true
  end

  def search_skills?
    return true
  end

end
