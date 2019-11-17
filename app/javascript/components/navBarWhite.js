const navBarWhite = () => {
  const navBar = document.querySelector('.navbar');
  window.addEventListener('scroll', () => {
    if (window.scrollY >= (window.innerHeight - 300)) {
      navBar.classList.add('bg-white');
      navBar.classList.remove('bg-transparent');
    } else {
      navBar.classList.remove('bg-white');
      navBar.classList.add('bg-transparent');
    }
  });
}

export { navBarWhite }
