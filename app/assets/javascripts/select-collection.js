$(document).on("page:change", function () {
    $('#select-collection').selectize({
      create: true,
      sortField: 'text'
    });
});
