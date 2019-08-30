//fonction 1

$(document).ready(function() {
title = $('.category-title');
card = title.next();
   card.hide();
title.on('click',function() {
	 card.hide();
	$(this).next().toggle();
	//on peut aussi utiliser show
});


  //fonction 2
  avatar = $('.avatar');
  drop = $('.dropdown');

  drop.hide();

  avatar.on('click',function (){
     drop.toggle();

  });

//fonction 3
let signUp = $('.modal_signup');
let body = $('body');

   connection = $('#connect');

   connection.on('click',function(event){
   event.preventDefault(); // manala ilay redirection an am registration 
   signUp.fadeIn(1000);

  }); 
});



