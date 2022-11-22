// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'
import '../stylesheets/public.css'
import '../stylesheets/admin.css'

import Raty from "raty.js"
// windowに表示されているratyにfunction(引数１,引数２)の情報を渡す
window.raty = function(elem,opt) {
  // Raty本体のオブジェクトを作成し引数をあたえたものを変数ratyに代入
  let raty =  new Raty(elem,opt)
  raty.init();
  // 値を返す
  return raty;
}


Rails.start()
Turbolinks.start()
ActiveStorage.start()