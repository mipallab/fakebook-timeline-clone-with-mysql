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
        // console.log(data);

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

  $(document).on("click", ".comment-like", function () {
    // get post id form timeline
    const commentId = $(this).attr("comment_id");

    $.ajax({
      url: "./ajax/all_request.php?action=comment-like",
      type: "POST",
      data: {
        comment_id: commentId,
      },

      success: (data) => {
        // console.log(data);

        // timeline reload
        timeLineAllData();
      },
    });
  });
});
