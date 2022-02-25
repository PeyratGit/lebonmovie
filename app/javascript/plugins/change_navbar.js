const changeOnScroll = () => {
  const navbar = document.getElementById('navbar');
  const navLinks = document.querySelectorAll(".nav-link");
  const bannerHome = document.querySelector(".banner-home");
  const searchQuery = document.querySelector("#query");
  const buyButtun = document.getElementById('buy-btn');

  console.log(bannerHome);
  console.log(navbar);

  if (navbar && bannerHome) {
    console.log('Hey')
    navLinks.forEach((el) => el.style.color = 'white')
    navbar.style.background = "transparent";

    window.onscroll = function() {
      if (window.scrollY >= 350) {
        navbar.style.backgroundColor = 'white';
        //navLinks.forEach((el) => el.style.color = 'black');
        buyButtun.style.color = 'black';
        searchQuery.style.border = '1px solid #ced4da';
      } else {
        navbar.style.backgroundColor = 'transparent';
        //navLinks.forEach((el) => el.style.color = 'white');
        buyButtun.style.color = 'white';
        searchQuery.style.border = 'none';
      }
    }
  }

}

export { changeOnScroll };
