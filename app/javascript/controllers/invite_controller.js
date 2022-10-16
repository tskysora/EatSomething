import { Controller } from "@hotwired/stimulus"
import { fetchWithToken } from "../utils/fetch_with_token";

export default class extends Controller {
  static targets = [ "url" ]

  copy() {
    this.urlTarget.select();
    this.urlTarget.setSelectionRange(0, 99999);

    // document.execCommand("copy");
    let inp =  this.urlTarget.value
    navigator.clipboard.writeText(inp);

    document.querySelector(".toast-body").innerHTML = "連結已複製！"
    $('.toast').toast('show');
  }

  async regenerate() {
    // const inviteToken = this.urlTarget.dataset.inviteToken;
    const groupId = this.urlTarget.dataset.groupId;
    const data = await fetch(`/groups/${groupId}/invite_link`, {
       headers: 
       {
         accept: "application/json" 
        } })
        .then( (response) => {
          // console.log(response);
          if (response.status==200) {
            return response.json();
          } else {
            return Promise.reject(response);
          }
        })
        .catch( (error) => {
          console.log(error);
        })
    // const data = await response.json();
    console.log(data);

    this.urlTarget.value = data.link;
    this.urlTarget.setAttribute('data-invite-token', data.invite_token);
    this.urlTarget.setAttribute('value', data.link);
    document.querySelector(".toast-body").innerHTML = "邀請連結已重新生成！"
    // $('.toast').toast('show');
  }
  
}

