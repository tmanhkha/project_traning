$(document).on("ready turbolinks:load",() => {
  $(".alert").delay(4000).slideUp(200, () => {
    $(this).alert('close');
  });
});
