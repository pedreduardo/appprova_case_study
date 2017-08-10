//= require bootstrap
//= require notifyjs

$(document).ready(function(){
  $('.submit_student')
  .on('ajax:success', function(e, data, status, xhr){
    $("#flash").notify('Aluno adicionado!', 'success');
    $('#item-'+data['student_id']).remove();
  })
  .on('ajax:error',function(e, xhr, status, error){
    $("#flash").notify('Erro ao adicionar aluno!', 'error');
  });
});
