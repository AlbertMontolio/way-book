// ### DRI 2525262
const jsIndexGeneralCategoryBtn = document.querySelectorAll(".js-index-general-category-btn");

const updateActiveClassIndexProfiles = () => {
	console.log("clicking .js-index-profile-categories-btn");
	let clickedBtn = event.target.parentElement;

    let categories = clickedBtn.closest(".js-categories");
    let categoryBtns = categories.querySelectorAll(".js-index-general-category-btn");

    categoryBtns.forEach((categoryBtn) => {
    	categoryBtn.classList.remove("active");
    });
    clickedBtn.classList.toggle("active");
}

showSpinner4 = () => {
	console.log("i am cliking .js-company-skill-btn");
	jsSpinnerWrapper = document.getElementById("js-spinner-wrapper");
    jsSpinnerWrapper.classList.remove("hide");
}

jsIndexGeneralCategoryBtn.forEach((indexGeneralCategoryBtn) => {
	indexGeneralCategoryBtn.addEventListener("click", updateActiveClassIndexProfiles);
	indexGeneralCategoryBtn.addEventListener("click", showSpinner4);
});

