console.log("test")
    const button = document.querySelector('#menu-button');
    console.log(button);
    let menu = document.querySelector('#menu');
    let submit = document.querySelector("#submit-button");
    button.addEventListener('click', function (event) {
      if (menu.style.display == "") {
        menu.style.display = "none";
        button.innerHTML = "Show Menu";
      } else {
        menu.style.display = "";
        button.innerHTML = "Hide Menu";
      }
    }
    );

    submit.addEventListener('click', function (event) {
      if (menu.style.display == "") {
        menu.style.display = "none";
      } else {
        menu.style.display = "";
      }
    });
