// import select2 from "select2/dist/js/select2"
document.addEventListener('turbo:load', () => {
  $('.event-store_id').select2({
    language: 'zh-TW',
    placeholder: '選擇店家...',

  });
})

// In your Javascript (external .js resource or <script> tag)
// $(document).ready(function () {
//   $('.js-example-basic-single').select2();
// });

// $('.event-store_id').select2({
//   language: 'zh-TW',
//   placeholder: '請選擇店家',
// });
