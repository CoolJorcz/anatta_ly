function addBackstretch( i, imageArray ) {

  var pictures = 
        imageArray.sort(function(){
        return Math.round(Math.random()) - 0.5;
      });

  var random_duration = (Math.random() + 5)*1000
  $('#backstretch'+i).backstretch(pictures, {duration: random_duration, fade: 750});
}

$(function(){
  var imageArray;

   $.get('/images', function(data){
      imageArray = data.images;
      for(i = 0; i < 11; i++) {
        setTimeout( addBackstretch(i, imageArray), 250 );
      }
  }, 'json')
});
