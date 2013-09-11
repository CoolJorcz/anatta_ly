$(function(){
  $("#collection").imagesLoaded( function(){
    var container = document.querySelector('#collection');
    var msnry = new Masonry( container, {
      // options...
      itemSelector: '.item',
    });
  });
});
