$(function(){
  $("#welcomegallery").imagesLoaded( function(){
    var container = document.querySelector('#welcomegallery');
    var msnry = new Masonry( container, {
      // options...
      itemSelector: '.polaroid',
    });
  });
});
