const btn_review_toggle = () => {
  const btn = document.getElementById('add-review-btn');
  const addReview = document.getElementById('add-review');
  const closeTableReview = document.querySelector('.close-table-review');
  const invalidFeedback = document.querySelector('.new_review .invalid-feedback');
  if (btn !== null ) {
    btn.addEventListener('click', (event) => {
      event.preventDefault;
      event.currentTarget.classList.add('hidden');
      addReview.classList.remove('hidden');
    });
    closeTableReview.addEventListener('click', (event) => {
      event.preventDefault;
      addReview.classList.add('hidden');
      btn.classList.remove('hidden');
    })
    if (invalidFeedback !== null) {
      addReview.classList.toggle('hidden');
      btn.classList.toggle('hidden');
    }
  }
};

export { btn_review_toggle };
