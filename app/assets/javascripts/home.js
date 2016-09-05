document.addEventListener("turbolinks:load", function() {
  document.getElementById("btn-explore").addEventListener("click", function(event) {
    $(window).scrollTo("#content-start", 800);
  });
});
