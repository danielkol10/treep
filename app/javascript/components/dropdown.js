console.log("test")
    const buttons = document.querySelectorAll('.menu-button');
    console.log(buttons);
    let menus = document.querySelectorAll('.menu');

    console.log(menus);

    buttons.forEach((button) => {
    button.addEventListener('click', function (event) {
      let menu = button.lastElementChild;
      console.log(button)
      menu.classList.toggle("hide-start");
    }
    );
    });

    let submit = document.querySelector(".submit-button");
    submit.addEventListener('click', function(event) {
    });
// button.disabled=true
