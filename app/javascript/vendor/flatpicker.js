document.addEventListener('turbo:load', () => {
  $('.datepicker').flatpickr({
    dateFormat: "Y-m-d",
    "locale": "zh_tw"
  });
})
