// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require_self
//= require popper
//= require bootstrap-sprockets
//= require jquery
//= require navbar
//= require_tree .

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'
import "@fortawesome/fontawesome-free/js/all";

require('./favourites')
require('./turbolink_fixes')

Rails.start()
Turbolinks.start()
ActiveStorage.start()
