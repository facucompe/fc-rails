function addRow(result) {
  $('#suggestion_table > tbody:last-child').append(
    `<tr>
      <td>${result.title}</td>
      <td>${result.author}</td>
      <td>${result.editoriral}</td>
      <td>${result.price}</td>
      <td>${result.link}</td>
    </tr>`
  );
};


$(function () {
  $('form').on('submit', function (event) {
    event.preventDefault();
    $form = $(this);
    $.ajax({
      type: "POST",
      url: $form.attr('action'),
      data: $form.serialize(),
      dataType: "JSON",
      success: function (result) {
        console.log(result);
        addRow(result);
        return false;
      },
      error: function (err) {
        console.log(err);
        return false;
      }
    });
    return false;
  });
});
