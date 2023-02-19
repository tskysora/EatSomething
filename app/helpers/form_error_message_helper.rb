module FormErrorMessageHelper
  def mee(field, form)
      err_mes = safe_join(form.object.errors"#{field}"
      conten_tag :div, class: "mt-1" do
        conten_tag :span, claaa: "text-danger" do
          errmes
        end
      end
  end
end
