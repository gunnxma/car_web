// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery-1.7.2.min
// require jquery.turbolinks
//= require jquery_ujs
//= require kindeditor
// require_tree .
// require turbolinks
//= require 'china_city/jquery.china_city'

//= require jquery-ui-1.8.21.custom.min
// require bootstrap-transition
// require bootstrap-alert
// require bootstrap-modal
// require bootstrap-dropdown
// require bootstrap-scrollspy
//= require bootstrap-tab
// require bootstrap-tooltip
// require bootstrap-popover
// require bootstrap-button
// require bootstrap-collapse
// require bootstrap-carousel
// require bootstrap-typeahead
// require bootstrap-tour
//= require jquery.cookie
// require fullcalendar.min
// require jquery.dataTables.min
// require excanvas
// require jquery.flot.min
// require jquery.flot.pie.min
// require jquery.flot.stack
// require jquery.flot.resize.min
//= require jquery.chosen.min
//= require jquery.uniform.min
//= require jquery.colorbox.min
//= require jquery.cleditor.min
// require jquery.noty
// require jquery.elfinder.min
// require jquery.raty.min
//= require jquery.iphone.toggle
// require jquery.autogrow-textarea
// require jquery.uploadify-3.1.min
//= require jquery.history
//= require charisma

//= require assessment

//= require datepicker-zh-TW

function printHtml(html) {
  var bodyHtml = document.body.innerHTML;
  document.body.innerHTML = html;
  window.print();
  document.body.innerHTML = bodyHtml;
}

function onprint() {
  var html = $("#printArea").html();
  printHtml(html);
}