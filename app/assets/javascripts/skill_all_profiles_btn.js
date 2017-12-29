const jsSkillAllProfilesBtn = document.querySelectorAll(".js-skill-all-profiles-btn");
// console.log(jsCategorySkillAllProfilesBtn);

const putActiveClass = () => {
	let clickedBtn = event.target.parentElement;
    console.log("clickedBtn");
    console.log(clickedBtn);
    
    clickedBtn.classList.add("is-included");
    clickedBtn.classList.remove("not-included");
}

const toggleAddRemoveSessionBtn = () => {
	// let clickedWrapper = event.target.closest(".js-category-skill-all-profiles-btn-wrapper");
	let clickedWrapper = event.target.parentElement.parentElement.parentElement;

	console.log("event.target");
	console.log(event.target);

	console.log("clickedWrapper");
	console.log(clickedWrapper);

	let adjacentSiblingWrapper;

	if ( clickedWrapper.classList.contains("js-is-active") ) {
		console.log("js-is-active");
		console.log("clickedWrapper");
		console.log(clickedWrapper);
		adjacentSiblingWrapper = clickedWrapper.nextSibling.nextSibling;
	} else {
		console.log("js-is-not-active");
		adjacentSiblingWrapper = clickedWrapper.previousSibling.previousSibling;
		console.log("adjcentSibling");
		console.log(adjacentSiblingWrapper);
	}

    clickedWrapper.classList.add("hide");
    adjacentSiblingWrapper.classList.remove("hide");
}

jsSkillAllProfilesBtn.forEach((btn) => {
	// btn.addEventListener("click", putActiveClass);
	btn.addEventListener("click", toggleAddRemoveSessionBtn);
});