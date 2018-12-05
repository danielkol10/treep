    const bigButtons = document.querySelectorAll('.menu-button');

    bigButtons.forEach((bigButton) => {
      bigButton.addEventListener('click', function(event) {
        let menu = bigButton.nextElementSibling;
        menu.classList.toggle("hide-start");

        menu.addEventListener("click", function(event){
          // console.log("bigButton baby");
          // console.log(bigButton.parentNode);
          // console.log(bigButton.parentNode.parentNode.nextElementSibling.firstElementChild);
          let next_guy = bigButton.parentNode.parentNode.nextElementSibling.firstElementChild;
          let next_menu = next_guy.querySelector('.menu');
          next_menu.classList.remove('hide-start');
          menu.classList.add('hide-start');
        })
      }
      );
    });

    let submits = document.querySelectorAll(".submit-venue-category");
    submits.forEach((submit) => {
      submit.addEventListener('click', function(event){

        // console.log(submit.parentNode.parentNode.nextElementSibling.firstElementChild);
        console.log("small button, size doesn't matter");
        // console.log(submit.parentNode.parentNode.parentNode.parentNode.parentNode.nextElementSibling.firstElementChild);
        let next_guy = submit.parentNode.parentNode.parentNode.parentNode.parentNode.nextElementSibling.firstElementChild;
        let next_menu = next_guy.querySelector('.menu');
        next_menu.classList.remove('hide-start');

        console.log(submit.parentNode.parentNode.parentNode);
        let current_menu = submit.parentNode.parentNode.parentNode;
        current_menu.classList.add('hide-start');
      })
    })
