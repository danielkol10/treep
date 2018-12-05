    const buttons = document.querySelectorAll('.menu-button');
    let menus = document.querySelectorAll('.menu');

    let submit = document.querySelectorAll(".submit-venue-category");

    buttons.forEach((button) => {
      button.addEventListener('click', function(event) {
        let menu = button.nextElementSibling;
        menu.classList.toggle("hide-start");
      }
      );
    });


    const allSubmitButtons = document.querySelectorAll('.submit-category-button');
    console.log(buttons.value);
    console.log(submit.value);
    allSubmitButtons.forEach((button) => {
      button.addEventListener('click', function(event) {
        menus.forEach((menu) => {
          if (button.value === submit.value) {
          menu.classList.add("hide-start");
          }
        });
      });
    });

