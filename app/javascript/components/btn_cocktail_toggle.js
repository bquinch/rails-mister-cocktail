const btn_cocktail_toggle = () => {
  const btn = document.getElementById('add-cocktail-btn');
  const addCocktail = document.querySelector('.add-cocktail');
  const closeTable = document.querySelector('.close-table');
  const invalidFeedback = document.querySelector('.invalid-feedback');
  if (btn !== null ) {
    btn.addEventListener('click', (event) => {
      event.preventDefault;
      event.currentTarget.classList.add('hidden');
      addCocktail.classList.remove('hidden');
    });
    closeTable.addEventListener('click', (event) => {
      event.preventDefault;
      addCocktail.classList.add('hidden');
      btn.classList.remove('hidden');
    })
    if (invalidFeedback !== null) {
        addCocktail.classList.toggle('hidden');
        btn.classList.toggle('hidden');
      }
  }
};

export { btn_cocktail_toggle };
