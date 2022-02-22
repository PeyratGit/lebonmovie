const changeOnScroll = () => {
  const navbar = document.getElementById('navbar')
  const navlinks = document.querySelectorAll(".nav-link")

  if (navbar) {
    window.onscroll = function() {
      console.log(window.scrollY)
      if (window.scrollY >= 360) {
        navbar.style.backgroundColor = 'white'
        navlinks.forEach((el) => el.style.color = 'black')
      } else {
        navbar.style.backgroundColor = 'transparent'
        navlinks.forEach((el) => el.style.color = 'white')
      }
    }
  }

}

export { changeOnScroll};
