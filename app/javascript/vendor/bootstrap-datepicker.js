import datepicker from 'bootstrap-datepicker/js/bootstrap-datepicker'

document.addEventListener('turbo:load', () => {
  var datepicker = new datepicker({
  });
})
$('.datepicker').datepicker();