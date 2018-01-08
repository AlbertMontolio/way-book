// ### DRI 2525262
jsIndexProfileCategoriesBtns = document.querySelectorAll(".js-index-profile-categories-btn");

// ### DRY afdafda
jsIndexProfileCategoriesBtns.forEach((indexProfileCategoriesBtn) => {
	indexProfileCategoriesBtn.addEventListener("click", updateActiveClassIndexProfile);
});