// ### DRI 2525262
const jsIndexProfileCategoriesBtns = document.querySelectorAll(".js-index-profile-categories-btn");

const updateActiveClassIndexProfile = () => {
	console.log("clicking .js-index-profile-categories-btn");
	let clickedBtn = event.target.parentElement;

    let categories = clickedBtn.closest(".js-categories");
    let categoryBtns = categories.querySelectorAll(".js-index-profile-categories-btn");

    categoryBtns.forEach((categoryBtn) => {
    	categoryBtn.classList.remove("active");
    });
    console.log("clickedBtn");
    console.log(clickedBtn);
    clickedBtn.classList.toggle("active");
}

// ### DRY afdafda
jsIndexProfileCategoriesBtns.forEach((indexProfileCategoriesBtn) => {
	indexProfileCategoriesBtn.addEventListener("click", updateActiveClassIndexProfile);
});