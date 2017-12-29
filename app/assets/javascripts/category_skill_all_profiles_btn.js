const jsCategorySkillAllProfilesBtn = document.querySelectorAll(".js-category-skill-all-profiles-btn");
// console.log(jsCategorySkillAllProfilesBtn);

const putActiveClass = () => {
	let clickedBtn = event.target.parentElement;
    console.log("clickedBtn");
    console.log(clickedBtn);
    
    clickedBtn.classList.add("is-included");
    clickedBtn.classList.remove("not-included");
}

const toggleAddRemoveSessionBtn = () => {
	let clickedWrapper = event.target.closest(".js-category-skill-all-profiles-btn-wrapper");
    console.log("clickedWrapper");
    console.log(clickedWrapper);
    
    clickedWrapper.classList.add("hide");
    clickedWrapper.nextSibling.remove("hide");
}

jsCategorySkillAllProfilesBtn.forEach((btn) => {
	btn.addEventListener("click", putActiveClass);
	btn.addEventListener("click", toggleAddRemoveSessionBtn);
});