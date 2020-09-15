$(document).ready(() => {
  $(".product-select-manufacturer").on('change', (event) => {
    console.log(event.target.value)
    // $.ajax({
    //   url: "/",
    //   type: "GET",
    //   data: { friend_ids: friendIds },
    //   dataType: "json",
    //   success: function(data, textStatus, jqXHR) {
    //     $("#header-friend-requests em").remove();
    //   },
    //   error: function(jqXHR, textStatus, errorThrown) {
    //     console.log("ERROR!");
    //   }
    // });
  })
})
