const companySkillBtns = document.querySelectorAll(".js-company-skill-btn");
console.log(companySkillBtns);

const putActiveClass = () => {
	let clickedBtn = event.target.parentElement;
    console.log("clickedBtn");
    console.log(clickedBtn);
    
    clickedBtn.classList.add("is-included");
    clickedBtn.classList.remove("not-included");
}

const toggleAddRemoveSessionBtn = () => {
	
	let clickedElement = event.target;
	let adjacentSibling;

	if ( clickedElement.classList.contains("green") ) {
		console.log("clickedElement");
		console.log(clickedElement);
		adjacentSibling = clickedElement.nextSibling.nextSibling;
	} else {
		console.log("gray");
		console.log("clickedElement");
		console.log(clickedElement);
		adjacentSibling = clickedElement.previousSibling.previousSibling;
		console.log("adjcentSibling");
		console.log(adjacentSibling);
	}

	clickedElement.classList.add("hide");
	adjacentSibling.classList.remove("hide");
}

companySkillBtns.forEach((btn) => {
	// btn.addEventListener("click", putActiveClass);
	// btn.addEventListener("click", toggleAddRemoveSessionBtn);
});