$(document).ready(function () {
  /**
   *
   * #################################
   * -------insert post like --------
   * #################################
   *
   **/
  $(document).on("click", ".postLike", function () {
    // get post id form timeline
    const postId = $(this).attr("postId");

    $.ajax({
      url: "./ajax/all_request.php?action=post-like",
      type: "POST",
      data: {
        postId: postId,
      },

      success: (data) => {
        console.log(data);

        // timeline reload
        timeLineAllData();
      },
    });
  });

  /**
   *
   * #################################
   * -------insert comment like --------
   * #################################
   *
   **/

  $(document).on("click", ".c", function () {
    // get post id form timeline
    const postId = $(this).attr("postId");

    $.ajax({
      url: "./ajax/all_request.php?actiondfsd=possadt-like",
      type: "POST",
      data: {
        postId: postId,
      },

      success: (data) => {
        console.log(data);

        // timeline reload
        timeLineAllData();
      },
    });
  });
});
