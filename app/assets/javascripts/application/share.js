$(function(){

  $('#approve').bind('ajax:success', function (event, data, status, xhr){
    alert(data.name)
  })
})
