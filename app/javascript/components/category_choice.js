const choices = document.querySelectorAll('.category-choice')

const toggleChoiceActive = (event) => {
  event.currentTarget.classList.toggle("active");
};

choices.forEach((choice) => {
  choice.addEventListener("click", toggleChoiceActive);
});


// export { activeChoice };


