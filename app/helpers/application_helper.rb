module ApplicationHelper
  include Pagy::Frontend
  def err_field(field, form, controller, autofocus: false)
    if form.object.errors[field].any?
      content_tag :div do
        tag.input class: "form-control is-invalid", type: "text", name: "#{controller}[#{field}]", id: "#{controller}_#{field}", autofocus: autofocus
      end
    else
      content_tag :div do
        tag.input class: "form-control", type: "text", name: "#{controller}[#{field}]", id: "#{controller}_#{field}", autofocus: autofocus, required: true
      end
    end
  end
  
  def err_message(field, form, controller)
    content_tag :div, class: "mt-1" do
      content_tag :span, class: "text-danger fs-7" do
        safe_join(form.object.errors[field])
      end
    end
  end

end

# , required: true