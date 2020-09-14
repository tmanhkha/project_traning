// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bootstrap'

// Import all javascript file
const importAll = r => r.keys().forEach(r);
const context = require.context(".", true, /\.js$/);
importAll(context);

require("jquery");
require("jquery-slimscroll");
require("daterangepicker");
require("metismenu");
require("select2");

import "css/icons.min.css";
import "css/app.min.css";
import "css/dataTables.bootstrap4.scss";

document.addEventListener("turbolinks:load", () => {
  require("js/app.min");
  require("js/jquery.dataTables");
  // require("hyper/js/dataTables.bootstrap4");
  require("js/datatable");
});
