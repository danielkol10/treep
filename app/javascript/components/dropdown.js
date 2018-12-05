     const buttons = document.querySelectorAll('.menu-button');

    let menus = document.querySelectorAll('.menu');


    let submit = document.querySelector("#submit-button");

    if(buttons.length > 0) {
    buttons.forEach((button) => {
    button.addEventListener('click', function (event) {
      let menu = button.lastElementChild;
      console.log(button)
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



export { dropDown };
