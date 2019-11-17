const make_bigger_image = () => {
  const image = document.querySelector('.image-thumbnail')
  image.addEventListener('click', (event) => {
    image.classList.toggle('image-bigger');
  });
}

export { make_bigger_image }
