class Api::V1::CompanySkillsController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User

    def create
        category = Category.find(params["company_skill"]["category_id"])
        company_skill = CompanySkill.new(strong_company_skill_params)
        company_skill.category = category
        company_skill.save
        render :no_content
    end

    def update
        id = params["company_skill"]["id"].to_i

        company_skill = CompanySkill.find(id)
        company_skill.update(strong_company_skill_params)
        render :no_content
    end

    def destroy
        id = params["company_skill"]["id"]
        company_skill = CompanySkill.find(id)
        company_skill.destroy
        render :no_content
    end

    private

    def strong_company_skill_params
    	params.require(:company_skill).permit(:name)
    end
end