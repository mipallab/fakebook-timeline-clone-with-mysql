$(document).ready(function () {
  $("#replay-comment-form").on("submit", function (e) {
    // form default behavior stop
    e.preventDefault();

    // get form data
    const form_data = new FormData(e.target);

    $.ajax({
      url: "./ajax/all_request.php?action=replay-comment",
      type: "POST",
      data: form_data,
      processData: false,
      contentType: false,
      dataType: "json",
      success: function (data) {
        console.log(data);

        let data_status = data.status;

        console.log(data_status);

        switch (data_status) {
          // success message show
          case "success":
            Swal.fire({
              position: "top-end",
              icon: "success",
              title: data.message,
              showConfirmButton: false,
              timer: 3500,
              position: "top-center",
            });

            // reset the form
            $("#replay-comment-form")[0].reset();

            // form model close
            $(".btn-close").click();

            // timeline reload
            timeLineAllData();

            break;

          // error message show
          case "error":
            Swal.fire({
              position: "top-end",
              icon: "error",
              title: data.message,
              showConfirmButton: false,
              timer: 3500,
              position: "top-center",
            });

            break;

          default:
            // default message show
            Swal.fire({
              position: "top-end",
              icon: "warning",
              title: data.message,
              text: "Show the console panel.to see what happen!",
              showConfirmButton: false,
              timer: 3500,
              position: "top-center",
            });

            // form model close
            $(".btn-close").click();

            timeLineAllData();

            break;
        }
      },
      error: function (error) {
        console.log(error);
      },
    });
  });
});
