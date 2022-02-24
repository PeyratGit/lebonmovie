// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"
import { changeOnScroll } from "../plugins/change_navbar"
changeOnScroll();

import { initSweetalert } from '../plugins/init_sweetalert';


document.addEventListener('turbolinks:load', () => {

  initSweetalert('#sweet-alert-purchase-movie', {
    title: "Thank your for your purchase!🎉",
    text: "You successfully send a request to the owner, we alert you when we have a response",
    icon: "success"
  }, (value) => {
    if (value) {
      const link = document.querySelector('#add-link');
      link.click();
    }
  });

  initSweetalert('#sweet-alert-delete-movie', {
    title: "Are you sure?",
    text: "This action cannot be reversed",
    icon: "warning"
  }, (value) => {
    if (value) {
      const link = document.querySelector('#delete-link');
      link.click();
    }
  });
})
