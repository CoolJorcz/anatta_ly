$(function(){

    $('.approve').bind('ajax:success', function (event, data, status, xhr){

      console.log(data)
      var approval = "You've approved " + data.name + "'s request! Be sure to coordinate a pick up time"
      var share_item = '#share' + data.id
      $(share_item).html(approval);


    });

    $('.deny').bind('ajax:success', function (event, data, status, xhr){

      var deny = "You've denied " + data.name + "'s request."
      var share_item = '#share' + data.id
      $(share_item).html(deny);
    });

    $('.picked_up').bind('ajax:success', function (event, data, status, xhr){

      var picked_up = "Pick up confirmed by: " + data.name + " at " + Date.new
      var share_item = '#share' + data.id
      $(share_item).html(picked_up);
    });

    $('.returned').bind('ajax:success', function (event, data, status, xhr){

      var returned = "Item returned. Be sure to give your review."
      var share_item = '#share' + data.id
      $(share_item).html(returned);
    });


});
