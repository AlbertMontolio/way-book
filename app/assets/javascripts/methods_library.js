const updateActiveClassIndexProfiles = () => {
    // copyyyyyyyyyyy
	console.log("clicking .js-index-profile-categories-btn");
	let clickedBtn = event.target.parentElement;
    console.log("clickedBtn event.target.parentElement");
    console.log(clickedBtn);

    let categories = clickedBtn.closest(".js-categories");
    let categoryBtns = categories.querySelectorAll(".js-index-general-category-btn");

    categoryBtns.forEach((categoryBtn) => {
    	categoryBtn.classList.remove("active");
    });
    clickedBtn.classList.toggle("active");
}

const updateActiveClassIndexProfile = () => {
    console.log("clicking .js-index-profile-categories-btn");
    let clickedBtn = event.target.parentElement;
    console.log("event.target.parentElement")
    console.log(clickedBtn)

    let categories = clickedBtn.closest(".js-categories");
    let categoryBtns = categories.querySelectorAll(".js-index-profile-categories-btn");

    categoryBtns.forEach((categoryBtn) => {
        categoryBtn.classList.remove("active");
    });
    console.log("clickedBtn");
    console.log(clickedBtn);
    clickedBtn.classList.toggle("active");
}

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
