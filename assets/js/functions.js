/**
 *
 * @param {timestpam value} timestamp
 * @returns
 */

function timeAgo(timestamp) {
  const createdAt = new Date(timestamp).getTime(); // Convert timestamp to milliseconds
  const currentTime = Date.now(); // Current time in milliseconds
  const postTime = currentTime - createdAt; // Difference in milliseconds

  // Convert time to different units
  const seconds = Math.floor(postTime / 1000);
  const minutes = Math.floor(seconds / 60);
  const hours = Math.floor(minutes / 60);
  const days = Math.floor(hours / 24);
  const weeks = Math.floor(days / 7);
  const months = Math.floor(days / 30);
  const years = Math.floor(months / 12);

  // Time ago conditions
  if (seconds < 60) {
    return "Just Now";
  } else if (minutes < 60) {
    return minutes === 1 ? "1 min ago" : `${minutes} mins ago`;
  } else if (hours < 24) {
    return hours === 1 ? "1 hour ago" : `${hours} hours ago`;
  } else if (days < 7) {
    return days === 1 ? "1 day ago" : `${days} days ago`;
  } else if (weeks < 4) {
    return weeks === 1 ? "1 week ago" : `${weeks} weeks ago`;
  } else if (months < 12) {
    return months === 1 ? "1 month ago" : `${months} months ago`;
  } else {
    return years === 1 ? "1 year ago" : `${years} years ago`;
  }
}

/**
 *
 * @param {sting vlaue pass} str
 * @returns
 */
function nl2br(str) {
  if (typeof str !== "string") {
    return "";
  }
  return str.replace(/\n/g, "<br>");
}

/**
 *
 * @param {*} postData
 * @returns
 */
function generatePostContent(postData) {
  let htmlContent = "";

  const photos = postData.post_photos || [];
  const videos = postData.post_videos || [];
  const photoCount = photos.length;

  if (photoCount === 4) {
    htmlContent += '<div class="post-image post-photo-4">';
    photos.forEach((photo) => {
      htmlContent += `
                <a class="post-photos-lightbox" data-gall="myGallery"
                   href="assets/images/post-images/${photo}" title="${photo}" data-maxwidth="">
                   <img src="assets/images/post-images/${photo}" />
                </a>`;
    });
    htmlContent += "</div>";
  } else if (photoCount === 3) {
    htmlContent += '<div class="post-image post-photo-3">';
    photos.forEach((photo) => {
      htmlContent += `
                <a class="post-photos-lightbox" data-gall="myGallery"
                   href="assets/images/post-images/${photo}" title="${photo}" data-maxwidth="">
                   <img src="assets/images/post-images/${photo}" />
                </a>`;
    });
    htmlContent += "</div>";
  } else if (photoCount === 2) {
    htmlContent += '<div class="post-image post-photo-2">';
    photos.forEach((photo) => {
      htmlContent += `
                <a class="post-photos-lightbox" data-gall="myGallery"
                   href="assets/images/post-images/${photo}" title="${photo}" data-maxwidth="">
                   <img src="assets/images/post-images/${photo}" />
                </a>`;
    });
    htmlContent += "</div>";
  } else if (photoCount === 1) {
    htmlContent += '<div class="post-image post-photo-1">';
    photos.forEach((photo) => {
      htmlContent += `
                <a class="post-photos-lightbox" data-gall="myGallery"
                   href="assets/images/post-images/${photo}" title="${photo}" data-maxwidth="">
                   <img class="oneImg" src="assets/images/post-images/${photo}" />
                </a>`;
    });
    htmlContent += "</div>";
  } else if (photoCount > 4) {
    const totalPhotos = photos.length;
    const endNum = 3;
    const startNum = totalPhotos - endNum;

    htmlContent += '<div class="post-image post-photo-fiveplus">';
    photos.slice(0, endNum).forEach((photo, index) => {
      htmlContent += `
                <a class="post-photos-lightbox" data-gall="myGallery"
                   href="assets/images/post-images/${photo}" title="${photo}" data-maxwidth="">
                   ${index === 0 ? `<p class="hello">5+</p>` : ""}
                   <img src="assets/images/post-images/${photo}" />
                </a>`;
    });

    photos.slice(startNum).forEach((photo, index) => {
      htmlContent += `
                <a class="post-photos-lightbox filveplus" data-gall="myGallery"
                   href="assets/images/post-images/${photo}" title="${photo}" data-maxwidth="">
                   ${index === 0 ? `<p class="hello">${startNum}+</p>` : ""}
                </a>`;
    });

    htmlContent += "</div>";
  }

  if (videos.length > 0) {
    htmlContent += '<div class="post-video">';
    videos.forEach((video) => {
      htmlContent += `
                <video width="320" height="240" controls>
                    <source src="assets/images/post-videos/${video}" type="video/mp4">
                </video>`;
    });
    htmlContent += "</div>";
  }

  return htmlContent;
}

/**
 *
 * @param {post images} images
 * @param {post videos} videos
 */
function renderMediaHTML(images = [], videos = []) {
  // Ensure images and videos are arrays
  if (!Array.isArray(images)) images = [];
  if (!Array.isArray(videos)) videos = [];

  let html = "";

  // Handle Images
  if (images.length === 1) {
    html += `
        <div class="post-image post-photo-1">
            <a class="post-photos-lightbox" data-gall="myGallery"
                href="assets/images/post-images/${images[0]}" title="${images[0]}" data-maxwidth="">
                <img class="oneImg" src="assets/images/post-images/${images[0]}" />
            </a>
        </div>`;
  } else if (images.length === 2) {
    html += `
        <div class="post-image post-photo-2">
            ${images
              .map(
                (img) => `
            <a class="post-photos-lightbox" data-gall="myGallery"
                href="assets/images/post-images/${img}" title="${img}" data-maxwidth="">
                <img src="assets/images/post-images/${img}" />
            </a>`
              )
              .join("")}
        </div>`;
  } else if (images.length === 3) {
    html += `
        <div class="post-image post-photo-3">
            ${images
              .map(
                (img) => `
            <a class="post-photos-lightbox" data-gall="myGallery"
                href="assets/images/post-images/${img}" title="${img}" data-maxwidth="">
                <img src="assets/images/post-images/${img}" />
            </a>`
              )
              .join("")}
        </div>`;
  } else if (images.length === 4) {
    html += `
        <div class="post-image post-photo-4">
            ${images
              .map(
                (img) => `
            <a class="post-photos-lightbox" data-gall="myGallery"
                href="assets/images/post-images/${img}" title="${img}" data-maxwidth="">
                <img src="assets/images/post-images/${img}" />
            </a>`
              )
              .join("")}
        </div>`;
  } else if (images.length > 4) {
    html += `
        <div class="post-image post-photo-fiveplus">
            ${images
              .slice(0, 3)
              .map(
                (img) => `
            <a class="post-photos-lightbox" data-gall="myGallery"
                href="assets/images/post-images/${img}" title="${img}" data-maxwidth="">
                <img src="assets/images/post-images/${img}" />
            </a>`
              )
              .join("")}
            <p class="hello">5+</p>
            ${images
              .slice(-3)
              .map(
                (img) => `
            <a class="post-photos-lightbox fiveplus" data-gall="myGallery"
                href="assets/images/post-images/${img}" title="${img}" data-maxwidth="">
                <p class="hello">${images.length - 3}+</p>
            </a>`
              )
              .join("")}
        </div>`;
  }

  // Handle Videos
  if (videos.length > 0) {
    html += `
        <div class="post-video">
            ${videos
              .map(
                (video) => `
            <video width="320" height="240" controls>
                <source src="assets/images/post-videos/${video}" type="video/mp4">
            </video>`
              )
              .join("")}
        </div>`;
  }

  return html;
}

/**
 *
 * @param {comment data} commentsArray
 * @returns {HTML blog}
 */

function renderComments(commentsArray) {
  // Check if comments exist
  if (!commentsArray || commentsArray.length === 0) {
    return `<p style= "font-size: 15px; font-weight: 200; margin-top: 26px;">No comments available.</p>`;
  }

  // Iterate through comments and generate HTML
  let commentsHTML = `<div class="post-comment-area">`;

  commentsArray.forEach((comment) => {
    commentsHTML += `
          <div class="comment-item">
            <div class="parent-comment">
                <img class="auth" src="./assets/images/profile-images/${
                  comment.comment_user_photo
                }" alt="${comment.comment_user_name}">
                  <div class="comment-data">
                      <a href="#" class="comment-user-name">${
                        comment.comment_user_name
                      }</a>
                      <p class="comment-text">${comment.comment_text}</p>
                      ${
                        comment.comment_image
                          ? `<img src="./assets/images/post-images/${comment.comment_image}" alt="Comment Image" class="comment-image">`
                          : ""
                      }
                      ${
                        comment.comment_video_url
                          ? `<video width="320" height="240" controls>
                <source src="assets/images/post-videos/${comment.comment_video_url}" type="video/mp4">
            </video>`
                          : ""
                      }
                      <p class="time-ago">${timeAgo(
                        comment.comment_created_at
                      )}</p>
                      
                      <div class="com-info">
                          <div class="lcount">
                              <span>${comment.comment_likes_count}</span>
                          </div>
                          <div class="like">
                            <span class="cursor-pointer comment-like" comment_id="${
                              comment.comment_id
                            }">
                                    Like
                            </span>
                          </div>
                          <div class="replay">
                              <span id="replay-comment-modal" data-bs-target="#commentReplayModal"
                                  data-bs-toggle="modal" comment_r_id="${
                                    comment.comment_id
                                  }">
                                  replay
                              </span>
                          </div>
                      </div>
                    </div>
            </div>
             ${renderReplies(comment.replies)}
          </div>`;
  });

  commentsHTML += `</div>`;
  return commentsHTML;
}

// Function to render replies
function renderReplies(repliesJSON) {
  if (!repliesJSON) return "";

  const repliesArray = JSON.parse(repliesJSON);
  let repliesHTML = `<div class="replay-comment">`;

  repliesArray.forEach((reply) => {
    repliesHTML += `
          <div class="replay-item">
              <img class="auth" src="./assets/images/profile-images/${
                reply.reply_user_photo
              }" alt="${reply.reply_user_name}" class="reply-user-photo">
              <div class="reply-content">
                  <a href="#" class="reply-user-name">${
                    reply.reply_user_name
                  }</a>
                  <p class="reply-text">${
                    reply.reply_text ? reply.reply_text : ""
                  }</p>
                  ${
                    reply.reply_image
                      ? `<img src="./assets/images/post-images/${reply.reply_image}" alt="" class="comment-image">`
                      : ""
                  }
                  <p class="reply-time-ago">${timeAgo(
                    reply.reply_created_at
                  )}</p>

                  <div class="reply-com-info">
                          <div class="lcount"><span>${
                            reply.reply_likes_count
                          }</span>
                          </div>
                          <div class="like "><span class="comment-like cursor-pointer" comment_id="${
                            reply.reply_id
                          }">
                                  Like</span></div>
                          
                      </div>
              </div>
          </div>`;
  });

  repliesHTML += `</div>`;
  return repliesHTML;
}
