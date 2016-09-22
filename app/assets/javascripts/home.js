document.addEventListener("turbolinks:load", function() {
  if ($(".home.index").length == 0) return;
  document.getElementById("btn-explore").addEventListener("click", function(event) {
    $(window).scrollTo("#content-start", 800);
  });
});
