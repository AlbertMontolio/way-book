companySkillBtns = document.querySelectorAll(".js-company-skill-btn");

const showSpinner = () => {
	console.log("i am cliking .js-company-skill-btn");
	jsSpinnerWrapper = document.getElementById("js-spinner-wrapper");
    jsSpinnerWrapper.classList.remove("hide");
}

const hideSpinner = () => {
	console.log("i am cliking .js-company-skill-btn");
	jsSpinnerWrapper = document.getElementById("js-spinner-wrapper");
    jsSpinnerWrapper.classList.add("hide");
}


companySkillBtns.forEach((btn) => {
	btn.addEventListener("click", showSpinner);
});