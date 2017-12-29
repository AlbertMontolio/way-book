const categoryLinkWrappers = document.querySelectorAll(".category-link-wrapper");

const updateActiveClass = () => {
	let categoryLinkWrapper = event.target.parentElement;
    console.log(categoryLinkWrapper);
    categoryLinkWrappers.forEach((categoryLinkWrapper) => {
    	categoryLinkWrapper.classList.remove("active");
    });
    categoryLinkWrapper.classList.toggle("active");
}

categoryLinkWrappers.forEach((categoryLinkWrapper) => {
	categoryLinkWrapper.addEventListener("click", updateActiveClass);
});