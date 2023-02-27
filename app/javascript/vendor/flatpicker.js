document.addEventListener('turbo:load', () => {
  $('.datepicker').flatpickr({
    dateFormat: "Y-m-d",
    locale: "zh_tw",
    allowInput: true,
    altInput: true,
    altFormat: "Y-m-d",
    minDate: "today",
  });
})
