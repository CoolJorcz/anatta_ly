$(function(){
  $('#approve').bind('ajax:success', function (event, data, status, xhr){
    console.log(data);
    var approval = "You've approved " + data.name + "'s request! Be sure to coordinate a pick up time"
    var share_item = '#share' + data.id
    $(share_item).html(approval);
  })
})
