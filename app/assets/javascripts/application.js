// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require popper.min
//= require bootstrap
//= require activestorage
//= require book-tile
//= require category_tag
//= require common
//= require delete_book
//= require edit_book
//= require fetch_book
//= require header
//= require import_csv
//= require modal
//= require purchase_request
//= require remove_flash_after_fixed_time
//= require show_book
//= require show_rank_book
//= require sidebar
//= require tutorial
//= require update_book
//= require vote
//= require read_qr
//= require jsQR
//= require jquery-ui
//= require tag-it
//= require imagesloaded.pkgd.min
//= require masonry.pkgd.min
//= require Chart.min
//= require chartjs-plugin-colorschemes.min
//= require jquery.cookie-1.4.1.min
//= require intro

$.ajaxSetup({
  headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
  }
});

$(function () {
  $("[data-toggle=popover]").popover()
})
