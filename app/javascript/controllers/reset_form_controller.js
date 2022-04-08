import { Controller } from "stimulus"

export default class extends Controller {
  reset() {
    this.element.reset()
  }
}
<%= form_with(model: [@single_room ,@message], remote: true, class: "d-flex",
data: { controller: "reset-form", action: "turbo:submit-end->reset-form#reset" }) do |f| %>