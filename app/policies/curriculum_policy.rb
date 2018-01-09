class CurriculumPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
  	true
  end

  def create?
  	return true
  end
end
