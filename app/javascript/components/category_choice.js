const choices = document.querySelectorAll('.category-choice')

const toggleChoiceActive = (event) => {
  event.currentTarget.classList.toggle("active");
};

choices.forEach((choice) => {
  choice.addEventListener("click", toggleChoiceActive);
});


// export { activeChoice };
const budgets = document.querySelectorAll('.budget-choice')

const toggleBudgetActive = (event) => {
  const budgets = document.querySelectorAll('.budget-choice')
  budgets.forEach((budget) => {
    budget.classList.remove("active");
  });
  event.currentTarget.classList.toggle("active");
};

budgets.forEach((budget) => {
  budget.addEventListener("click", toggleBudgetActive);
});
