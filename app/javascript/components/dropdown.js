console.log("test")
    const buttons = document.querySelectorAll('.menu-button');
    console.log(buttons);
    let menus = document.querySelectorAll('.menu');

    console.log(menus);
    let submit = document.querySelector("#submit-button");

    buttons.forEach((button) => {
    button.addEventListener('click', function (event) {
      let menu = button.lastElementChild;
      console.log(button)
      if (menu.style.display == "") {
        menu.style.display = "none";
      } else {
        menu.style.display = "";
      }
    }
    );
    });

    submit.addEventListener('click', function (event) {
      if (menu.style.display == "") {
        menu.style.display = "none";
      } else {
        menu.style.display = "";
      }
    });
