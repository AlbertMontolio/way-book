class OwnCompanySkillPolicy < ApplicationPolicy
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

  def update?
      # inside a policy:
      # 1. user is the current_user
      # 2. record is the arugment passed to "authorize" in controller
      ### can i do that? record.profile, in order to get to the user?
      # i thought that in pundit one can just play with user and record
      record.profile.user == user
  end

  def destroy?
      # 1st : only an admin

      # 2nd: the owner can destroy
          record.profile.user == user
    end
end
