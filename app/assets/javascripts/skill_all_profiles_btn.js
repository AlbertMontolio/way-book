companySkillBtns = document.querySelectorAll(".js-company-skill-btn");

companySkillBtns.forEach((btn) => {
	btn.addEventListener("click", showSpinner);
});