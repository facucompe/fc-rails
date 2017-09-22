function addRow(repository) {
  console.log(repository);
  $('.repositories > tbody:last-child').append(
    `<tr>
      <td>${repository.name}</td>
      <td>${repository.url}</td>
    </tr>`
  );
};

function updateTable(response) {
  response.forEach(function(element) {
    addRow(element);
  }, this);
};

$('.repositories').ready(function () {
  var job_id = $('.repositories').data('job-id');
  var tries = 0;
  var interval = setInterval(function(){
    $.ajax({
      type: 'GET',
      url: `/api/v1/jobs/${job_id}`,
      success: function (result) {
        if (result.finished) {
          updateTable(result.response);
          clearInterval(interval);
        }
        return false;
      },
      error: function (err) {
        console.log(err);
        clearInterval(interval);
        return false;
      }
    });
  }, 1000);
  return false;
});
