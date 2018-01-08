// ### DRI 2525262
const jsIndexGeneralCategoryBtn = document.querySelectorAll(".js-index-general-category-btn");

jsIndexGeneralCategoryBtn.forEach((indexGeneralCategoryBtn) => {
	indexGeneralCategoryBtn.addEventListener("click", updateActiveClassIndexProfiles);
	indexGeneralCategoryBtn.addEventListener("click", showSpinner);
});

