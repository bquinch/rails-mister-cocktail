const btn_ingredient_toggle = () => {
  const btn = document.getElementById('add-ingredient-btn');
  const addIngredient = document.querySelector('.add-ingredients');
  const closeTableIngredient = document.querySelector('.close-table-ingredient');
  const invalidFeedback = document.querySelector('.new_dose .invalid-feedback');
  if (btn !== null ) {
    btn.addEventListener('click', (event) => {
      event.preventDefault;
      event.currentTarget.classList.add('hidden');
      addIngredient.classList.remove('hidden');
    });
    closeTableIngredient.addEventListener('click', (event) => {
      event.preventDefault;
      addIngredient.classList.add('hidden');
      btn.classList.remove('hidden');
    })
    if (invalidFeedback !== null) {
      addIngredient.classList.toggle('hidden');
      btn.classList.toggle('hidden');
    }
  }
};

export { btn_ingredient_toggle };
