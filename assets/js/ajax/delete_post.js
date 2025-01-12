$(document).on("click", ".delete_post", function () {
  // get post id
  const postId = $(this).attr("post_id");

  $.ajax({
    url: "./ajax/all_request.php?action=delete-post",
    type: "POST",
    data: {
      post_id: postId,
    },
    success: (data) => {
      console.log(data);

      Swal.fire({
        position: "top-end",
        icon: "success",
        title: "Deleted A Item",
        text: "A post deleted successfully!",
        showConfirmButton: false,
        timer: 5000,
        position: "top-center",
      });

      // reload all post
      timeLineAllData();
    },
  });
});
