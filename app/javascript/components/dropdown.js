    const buttons = document.querySelectorAll('.menu-button');
    let menus = document.querySelectorAll('.menu');

    // console.log(menus);
    let submit = document.querySelectorAll(".submit-venue-category");

    buttons.forEach((button) => {
    button.addEventListener('click', function (event) {
      let menu = button.nextElementSibling;
      console.log(menu)
      menu.classList.toggle("hide-start");
    }
    );
    });




    // submit.addEventListener('click', function (event) {
    //   if (menu.style.display == "") {
    //     menu.style.display = "none";
    //   } else {
    //     menu.style.display = "";
    //   }
    // });
// button.disabled=true
