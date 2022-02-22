const changeOnScroll = () => {
  const navbar = document.getElementById('navbar')

  if (navbar) {
    window.onscroll = function() {
      console.log(window.scrollY)
      if (window.scrollY >= 360) {
        navbar.style.backgroundColor = 'white'
      } else {
        navbar.style.backgroundColor = 'transparent'
      }
    }
  }

}

export { changeOnScroll};
