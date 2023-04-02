import Sortable from 'sortablejs';
import Rails from '@rails/ujs';

document.addEventListener('turbo:load', ()=> {
  let el = document.querySelector('.sortable-items');

  if (el) {
    Sortable.create(el, {
      onEnd: event => {
        
        let [model, id] = event.item.dataset.item.split('_');
        console.log(model, id)

        let slug = location.pathname.slice(8);
        
        let data = new FormData();
        data.append("id", slug);
        data.append("meal_id", id);
        data.append("from", event.oldIndex);
        data.append("to", event.newIndex);
        
        Rails.ajax({
          url: slug + '/sort',
          type: 'PUT',
          data,
          success: resp => {
            console.log(resp);
          },
          error: err => {
            console.log(err);
          }
        })
      }   
    })
  } else {
    
  }
});