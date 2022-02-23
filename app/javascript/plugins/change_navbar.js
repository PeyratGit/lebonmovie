const changeOnScroll = () => {
  const navbar = document.getElementById('navbar');
  const navLinks = document.querySelectorAll(".nav-link");
  const bannerHome = document.querySelector(".banner-home");



  if (navbar && bannerHome) {
    navLinks.forEach((el) => el.style.color = 'white')

    window.onscroll = function() {
      if (window.scrollY >= 360) {
        navbar.style.backgroundColor = 'white';
        navLinks.forEach((el) => el.style.color = 'black');
        search_query.style.border = '1px solid black';
      } else {
        navbar.style.backgroundColor = 'transparent';
        navLinks.forEach((el) => el.style.color = 'white');
        search_query.style.border = '1px solid black';
      }
    }
  }

}

export { changeOnScroll };
