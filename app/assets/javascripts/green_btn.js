const categoryLinkWrappers = document.querySelectorAll(".category-link-wrapper");

const doSomething = () => {
	let categoryLinkWrapper = event.target.parentElement;
    console.log(categoryLinkWrapper);
    categoryLinkWrappers.forEach((categoryLinkWrapper) => {
    	categoryLinkWrapper.classList.remove("active");
    });
    categoryLinkWrapper.classList.toggle("active");
    // event.target.classList.toggle("img-circle");
}

categoryLinkWrappers.forEach((categoryLinkWrapper) => {
	categoryLinkWrapper.addEventListener("click", doSomething);
});