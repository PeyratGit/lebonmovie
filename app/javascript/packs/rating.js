const rateOnHover = () => {
  const star_1 = document.getElementById('star_1');
  const star_2 = document.getElementById('star_2');
  const star_3 = document.getElementById('star_3');
  const star_4 = document.getElementById('star_4');
  const star_5 = document.getElementById('star_5');

  star_1.addEventListener("mouseover", func5, false);
  star_2.addEventListener("mouseover", func4, false);
  star_3.addEventListener("mouseover", func3, false);
  star_4.addEventListener("mouseover", func2, false);
  star_5.addEventListener("mouseover", func1, false);
  star_1.addEventListener("mouseout", func, false);
  star_2.addEventListener("mouseout", func, false);
  star_3.addEventListener("mouseout", func, false);
  star_4.addEventListener("mouseout", func, false);
  star_5.addEventListener("mouseout", func, false);

  function func()
  {
    star_5.innerText = "☆"
    star_4.innerText = "☆"
    star_3.innerText = "☆"
    star_2.innerText = "☆"
    star_1.innerText = "☆"
  }

  function func1()
  {
   star_5.innerText = "★"
  }

  function func2()
  {
   star_5.innerText = "★"
   star_4.innerText = "★"
  }

  function func3()
  {
   star_5.innerText = "★"
   star_4.innerText = "★"
   star_3.innerText = "★"
  }

  function func4()
  {
   star_5.innerText = "★"
   star_4.innerText = "★"
   star_3.innerText = "★"
   star_2.innerText = "★"
  }

  function func5()
  {
   star_5.innerText = "★"
   star_4.innerText = "★"
   star_3.innerText = "★"
   star_2.innerText = "★"
   star_1.innerText = "★"
  }

}

export { rateOnHover };
