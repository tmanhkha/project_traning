$(document).ready(() => {
  $("#product-select-manufacturer").select2({ placeholder: "Please select manufacturer" });

  $("#product-select-manufacturer").on('change', (event) => {
    if (event.target.value == '') {
      $("#product-select-model").empty();
      $("#product-select-data-memory").empty();
      return;
    }
    $.ajax({
      url: "/products/models_of_manufacturer",
      type: "GET",
      data: { manufacturer_id: event.target.value },
      dataType: "json",
      success: function(data, textStatus, jqXHR) {
        if (data) {
          $("#product-select-model").empty();
          $("#product-select-model").prepend('<option selected=""></option>').select2({ data: data, placeholder: "Please select a model" });
        }
      },
      error: function(jqXHR, textStatus, errorThrown) {
        console.log("ERROR!");
      }
    });
  })

  $("#product-select-model").on('change', (event) => {
    if (event.target.value == '') {
      $("#product-select-data-memory").empty();
      return;
    }
    $.ajax({
      url: "/products/data_memories_of_model",
      type: "GET",
      data: { model_id: event.target.value },
      dataType: "json",
      success: function(data, textStatus, jqXHR) {
        if (data) {
          $("#product-select-data-memory").empty();
          $("#product-select-data-memory").prepend('<option selected=""></option>').select2({ data: data, placeholder: "Please select a data memory" });
        }
      },
      error: function(jqXHR, textStatus, errorThrown) {
        console.log("ERROR!");
      }
    });
  })
})
